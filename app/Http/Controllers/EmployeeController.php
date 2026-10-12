<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class EmployeeController extends Controller
{
    private function checkAdmin(): void
    {
        if (auth()->user()->role !== 'admin') {
            abort(403);
        }
    }

    public function index()
    {
        $this->checkAdmin();

        $employees = Employee::latest()->get();

        return view('employees.index', compact('employees'));
    }

    public function create()
    {
        $this->checkAdmin();

        return view('employees.create');
    }

    public function store(Request $request)
    {
        $this->checkAdmin();

        $validated = $request->validate([
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'gender' => ['required', Rule::in(['Male', 'Female'])],
            'position' => [
            'required',
            Rule::in([
                'Encoder',
                'Programmer',
                'Project Coordinator',
                'Project Manager',
            ]),
        ],
            'birthday' => ['required', 'date', 'before:today'],
            'monthly_salary' => ['required', 'numeric', 'min:0'],
            'username' => ['required', 'string', 'max:255', 'unique:users,username'],
            'password' => ['required', 'string', 'min:8'],
            
        ]);

        DB::transaction(function () use ($validated) {
            $user = User::create([
                'name' => $validated['first_name'] . ' ' . $validated['last_name'],
                'username' => $validated['username'],
                'password' => Hash::make($validated['password']),
                'role' => 'user',
            ]);

            Employee::create([
                'user_id' => $user->id,
                'first_name' => $validated['first_name'],
                'last_name' => $validated['last_name'],
                'gender' => $validated['gender'],
                'birthday' => $validated['birthday'],
                'monthly_salary' => $validated['monthly_salary'],
                'position' => $validated['position'],
            ]);
        });

        return redirect()->route('employees.index')
            ->with('success', 'Employee created successfully.');
    }

    public function edit(Employee $employee)
    {
        $this->checkAdmin();

        return view('employees.edit', compact('employee'));
    }

    public function update(Request $request, Employee $employee)
    {
        $this->checkAdmin();

        $validated = $request->validate([
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'gender' => ['required', Rule::in(['Male', 'Female'])],
            'position' => [
            'required',
            Rule::in([
                'Encoder',
                'Programmer',
                'Project Coordinator',
                'Project Manager',
            ]),
        ],
            'birthday' => ['required', 'date', 'before:today'],
            'monthly_salary' => ['required', 'numeric', 'min:0'],
        ]);

        DB::transaction(function () use ($employee, $validated) {
            $employee->update($validated);

            if ($employee->user) {
                $employee->user->update([
                    'name' => $validated['first_name'] . ' ' . $validated['last_name'],
                ]);
            }
        });

        return redirect()->route('employees.index')
            ->with('success', 'Employee updated successfully.');
    }

    public function destroy(Employee $employee)
    {
        $this->checkAdmin();

        DB::transaction(function () use ($employee) {
            if ($employee->user) {
                $employee->user->delete();
            }

            $employee->delete();
        });

        return redirect()->route('employees.index')
            ->with('success', 'Employee and linked account deleted successfully.');
    }
}
