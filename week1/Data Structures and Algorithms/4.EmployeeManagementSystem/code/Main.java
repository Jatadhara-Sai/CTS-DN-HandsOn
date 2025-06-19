public class Main {
    public static void main(String[] args) {
        EmployeeManager manager = new EmployeeManager(5);

        // Adding Employees
        manager.addEmployee(new Employee(1, "Alice", "Manager", 60000));
        manager.addEmployee(new Employee(2, "Bob", "Engineer", 50000));
        manager.addEmployee(new Employee(3, "Charlie", "HR", 40000));

        System.out.println("All Employees:");
        manager.traverseEmployees();

        System.out.println("\nSearching for Employee ID 2:");
        Employee emp = manager.searchEmployee(2);
        System.out.println(emp != null ? emp : "Not Found");

        System.out.println("\nDeleting Employee ID 2:");
        boolean deleted = manager.deleteEmployee(2);
        System.out.println(deleted ? "Deleted" : "Not Found");

        System.out.println("\nEmployees After Deletion:");
        manager.traverseEmployees();
    }
}
