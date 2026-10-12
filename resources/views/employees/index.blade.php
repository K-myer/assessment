<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employees | Employee Management System</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
</head>
<body>
    <header class="topbar">
        <strong>Employee Management System</strong>

        <nav class="nav-actions">
            <a href="{{ route('dashboard') }}">Dashboard</a>
            <a href="{{ route('employees.index') }}">Employees</a>

            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" class="button-secondary">Logout</button>
            </form>
        </nav>
    </header>

    <main class="page-container">
        <div class="page-header">
            <div>
                <h1>Manage Employees</h1>
                <p>View, update, and manage employee records.</p>
            </div>

            <a class="button" href="{{ route('employees.create') }}">
                + Add Employee
            </a>
        </div>

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        <section class="panel">
            <div class="page-header">
                <div>
                    <h2 style="margin: 0;">Employee Records</h2>
                    <p>Employee information and monthly salary.</p>
                </div>

                <span>
                    Total: <strong>{{ $employees->count() }}</strong>
                </span>
            </div>

            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Gender</th>
                            <th>Position</th>
                            <th>Birthday</th>
                            <th>Monthly Salary</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        @forelse ($employees as $employee)
                            <tr>
                                <td>{{ $employee->id }}</td>
                                <td>{{ $employee->first_name }}</td>
                                <td>{{ $employee->last_name }}</td>
                                <td>{{ $employee->gender }}</td>
                                <td>{{ $employee->position ?? 'Not assigned' }}</td>
                                <td>{{ $employee->birthday }}</td>
                                <td>₱{{ number_format($employee->monthly_salary, 2) }}</td>
                                <td>
                                    <div class="table-actions">
                                        <a
                                            class="button button-secondary button-small"
                                            href="{{ route('employees.edit', $employee) }}"
                                        >
                                            Edit
                                        </a>

                                        <form
                                            method="POST"
                                            action="{{ route('employees.destroy', $employee) }}"
                                            onsubmit="return confirm('Are you sure you want to delete this employee?')"
                                        >
                                            @csrf
                                            @method('DELETE')

                                            <button
                                                type="submit"
                                                class="button-danger button-small"
                                            >
                                                Delete
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="8" style="text-align: center; padding: 32px;">
                                    No employees found. Create your first employee to get started.
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </section>

        <p style="margin-top: 20px;">
            <a href="{{ route('dashboard') }}">← Back to Dashboard</a>
        </p>
    </main>
</body>
</html>
