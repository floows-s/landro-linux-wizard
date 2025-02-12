<x-layout>
    <x-slot:heading>Job Page</x-slot:heading>

    <h1 class="font-bold text-lg"><strong>{{ $job['title'] }}</strong></h1>
    <p>Salary  year: {{ $job['salary'] }}.</p>
</x-layout>
