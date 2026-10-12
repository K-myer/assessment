<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee | Employee Management System</title>
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
                <h1>Edit Employee</h1>
                <p>
                    Update the information for
                    {{ $employee->first_name }} {{ $employee->last_name }}.
                </p>
            </div>

            <a class="button button-secondary"
               href="{{ route('employees.index') }}">
                Back to Employees
            </a>
        </div>

        @if ($errors->any())
            <div class="alert alert-error">
                <strong>Please correct the following errors:</strong>

                @foreach ($errors->all() as $error)
                    <p>{{ $error }}</p>
                @endforeach
            </div>
        @endif

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        <section class="form-card">
            <form method="POST"
                  action="{{ route('employees.update', $employee) }}">
                @csrf
                @method('PUT')

                <h2 style="margin-top: 0;">Employee Information</h2>

                <div class="form-grid">
                    <div class="form-field">
                        <label for="first_name">First Name</label>
                        <input
                            type="text"
                            id="first_name"
                            name="first_name"
                            value="{{ old('first_name', $employee->first_name) }}"
                            required
                        >
                    </div>

                    <div class="form-field">
                        <label for="last_name">Last Name</label>
                        <input
                            type="text"
                            id="last_name"
                            name="last_name"
                            value="{{ old('last_name', $employee->last_name) }}"
                            required
                        >
                    </div>

                    <div class="form-field">
                        <label for="gender">Gender</label>
                        <select id="gender" name="gender" required>
                            <option value="">Select gender</option>
                            <option value="Male" {{ old('gender', $employee->gender) == 'Male' ? 'selected' : '' }}>
                                Male
                            </option>
                            <option value="Female" {{ old('gender', $employee->gender) == 'Female' ? 'selected' : '' }}>
                                Female
                            </option>
                        </select>
                    </div>

                    <div class="form-field">
                        <label for="position">Position</label>
                        <select id="position" name="position" required>
                            <option value="">Select position</option>
                            <option value="Encoder" {{ old('position', $employee->position) == 'Encoder' ? 'selected' : '' }}>
                                Encoder
                            </option>
                            <option value="Programmer" {{ old('position', $employee->position) == 'Programmer' ? 'selected' : '' }}>
                                Programmer
                            </option>
                            <option value="Project Coordinator" {{ old('position', $employee->position) == 'Project Coordinator' ? 'selected' : '' }}>
                                Project Coordinator
                            </option>
                            <option value="Project Manager" {{ old('position', $employee->position) == 'Project Manager' ? 'selected' : '' }}>
                                Project Manager
                            </option>
                        </select>
                    </div>

                    <div class="form-field">
                        <label for="birthday">Birthday</label>
                        <input
                            type="date"
                            id="birthday"
                            name="birthday"
                            value="{{ old('birthday', $employee->birthday) }}"
                            required
                        >
                    </div>

                    <div class="form-field">
                        <label for="monthly_salary">Monthly Salary (₱)</label>
                        <input
                            type="number"
                            id="monthly_salary"
                            name="monthly_salary"
                            min="0"
                            step="0.01"
                            value="{{ old('monthly_salary', $employee->monthly_salary) }}"
                            required
                        >
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit">Update Employee</button>

                    <a class="button button-secondary"
                       href="{{ route('employees.index') }}">
                        Cancel
                    </a>
                </div>
            </form>
        </section>
    </main>
</body>
</html>
