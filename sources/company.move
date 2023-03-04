//Address that will publish this module followed by name of the module
module 0x42::Company {
    use std::vector;
    const CONTRACT:address = @0x42;

    struct Employees {
        people: vector<Employee>
    }

    //In Move - we can natively work only with signed integers
    struct Employee has drop, key, copy {
        name: vector<u8>,
        age: u8,
        income: u64,
    }

    public fun create_employee(_employee: Employee, _employees: &mut Employees) : Employee {
        let newEmployee = Employee {
            name: _employee.name,
            age: _employee.age,
            income: _employee.income
        };

        add_employee(newEmployee, _employees);
        return newEmployee
    } 

    fun add_employee(newEmployee: Employee, _employees: &mut Employees) {
        vector::push_back(&mut _employees.people, newEmployee);
    }

    //TODO: Increase income
    //STEPS
    //1. Write a function called "increase_income" which takes in 2 parameters:_employee
    // a. A &mut Employee
    // b. A bonus amount
    // Write the logic to update the income and return the Employee struct

    fun increase_income(_employee: &mut Employee, bonus: u64) : &mut Employee {
        _employee.income = _employee.income + bonus;
        return _employee
    }
    
   
    //TODO: Write test cases for the above functions
}