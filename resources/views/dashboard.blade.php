<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Employee Management System</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <header class="topbar">
        <strong>Employee Management System</strong>

        <nav class="nav-actions">
            <a href="{{ route('dashboard') }}">Dashboard</a>

            @if (auth()->user()->role === 'admin')
                <a href="{{ route('employees.index') }}">Employees</a>
                <a href="{{ route('employees.create') }}">Add Employee</a>
            @endif

            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" class="button-secondary">Logout</button>
            </form>
        </nav>
    </header>

    <main class="page-container">
        <div class="page-header">
            <div>
                <h1>Dashboard</h1>
                <p>
                    Welcome, {{ auth()->user()->username }}.
                    Here's your employee management overview.
                </p>
            </div>
        </div>

        {{-- Statistics visible to all logged-in users --}}
        <section class="stats">
            <div class="card">
                <h3>Total Employees</h3>
                <div class="number">{{ $totalEmployees }}</div>
            </div>

            <div class="card">
                <h3>Male Employees</h3>
                <div class="number">{{ $maleCount }}</div>
            </div>

            <div class="card">
                <h3>Female Employees</h3>
                <div class="number">{{ $femaleCount }}</div>
            </div>

            <div class="card">
                <h3>Average Age</h3>
                <div class="number">{{ number_format($averageAge, 1) }}</div>
                <p>Years old</p>
            </div>
        </section>

        <section class="panel">
            <h2>Total Monthly Salary</h2>
            <p>Total combined monthly employee salary</p>
            <div class="number">
                ₱{{ number_format($totalSalary, 2) }}
            </div>
        </section>

        <h2>Employee Analytics</h2>

        <section class="charts">
            <div class="chart-card">
                <h3>Employees by Gender</h3>
                <div class="chart-container">
                    <canvas id="genderChart"></canvas>
                </div>
            </div>

            <div class="chart-card">
                <h3>Employee Count by Position</h3>
                <div class="chart-container">
                    <canvas id="positionCountChart"></canvas>
                </div>
            </div>

            <div class="chart-card">
                <h3>Payroll Overview By Position</h3>
                <div class="chart-container">
                    <canvas id="salaryChart"></canvas>
                </div>
            </div>
        </section>

        {{-- Employee management remains admin-only --}}
        @if (auth()->user()->role === 'admin')
            <section class="panel" style="margin-top: 24px;">
                <h2>Employee Management</h2>
                <p>Manage employee records and account information.</p>

                <div class="actions">
                    <a class="button" href="{{ route('employees.index') }}">
                        Manage Employees
                    </a>

                    <a class="button button-secondary"
                       href="{{ route('employees.create') }}">
                        Add New Employee
                    </a>
                </div>
            </section>
        @endif
    </main>

    <script>
        const positions = @json($positions);
        const employeeCounts = @json(array_values($countByPosition));
        const salaryTotals = @json(array_values($salaryByPosition));

        new Chart(document.getElementById('genderChart'), {
            type: 'doughnut',
            data: {
                labels: ['Male', 'Female'],
                datasets: [{
                    data: [{{ $maleCount }}, {{ $femaleCount }}],
                    backgroundColor: ['#2563eb', '#ec4899'],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        new Chart(document.getElementById('positionCountChart'), {
            type: 'bar',
            data: {
                labels: positions,
                datasets: [{
                    label: 'Employees',
                    data: employeeCounts,
                    backgroundColor: '#3b82f6',
                    borderRadius: 5
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: { precision: 0 }
                    }
                }
            }
        });

        new Chart(document.getElementById('salaryChart'), {
            type: 'bar',
            data: {
                labels: positions,
                datasets: [{
                    label: 'Monthly Salary (₱)',
                    data: salaryTotals,
                    backgroundColor: '#14b8a6',
                    borderRadius: 5
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    </script>
</body>
</html>
