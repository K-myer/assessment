
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EmployeeController;

Route::get('/', function () {
    return redirect()->route('login');
});

Route::get('/login', function () {
    return view('login');
})->name('login');

Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth')->group(function () {
    

Route::get('/dashboard', function () {
    $employees = \App\Models\Employee::all();

    $maleCount = $employees->where('gender', 'Male')->count();
    $femaleCount = $employees->where('gender', 'Female')->count();

    $averageAge = $employees->isEmpty()
        ? 0
        : round($employees->avg(function ($employee) {
            return \Carbon\Carbon::parse($employee->birthday)->age;
        }), 1);

    $totalSalary = $employees->sum('monthly_salary');
    $totalEmployees = $employees->count();

    $positions = [
        'Encoder',
        'Programmer',
        'Project Coordinator',
        'Project Manager',
    ];

    $salaryByPosition = [];
    $countByPosition = [];

    foreach ($positions as $position) {
        $positionEmployees = $employees->where('position', $position);

        $salaryByPosition[$position] = $positionEmployees->sum('monthly_salary');
        $countByPosition[$position] = $positionEmployees->count();
    }

    return view('dashboard', compact(
    'maleCount',
    'femaleCount',
    'averageAge',
    'totalSalary',
    'totalEmployees',
    'positions',
    'salaryByPosition',
    'countByPosition'
));
})->name('dashboard');



    Route::post('/logout', [AuthController::class, 'logout'])
        ->name('logout');

    Route::get('/employees', [EmployeeController::class, 'index'])
        ->name('employees.index');

    Route::get('/employees/create', [EmployeeController::class, 'create'])
        ->name('employees.create');

    Route::post('/employees', [EmployeeController::class, 'store'])
        ->name('employees.store');
        
    Route::get('/employees/{employee}/edit', [EmployeeController::class, 'edit'])
        ->name('employees.edit');

    Route::put('/employees/{employee}', [EmployeeController::class, 'update'])
        ->name('employees.update');

    Route::delete('/employees/{employee}', [EmployeeController::class, 'destroy'])
        ->name('employees.destroy');

});
