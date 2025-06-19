public class Main {
    public static void main(String[] args) {
        TaskLinkedList taskList = new TaskLinkedList();

        // Add tasks
        taskList.addTask(new Task(1, "Design UI", "Pending"));
        taskList.addTask(new Task(2, "Write Backend", "In Progress"));
        taskList.addTask(new Task(3, "Test App", "Pending"));

        System.out.println("All Tasks:");
        taskList.traverseTasks();

        System.out.println("\nSearching for Task ID 2:");
        Task t = taskList.searchTask(2);
        System.out.println(t != null ? t : "Not Found");

        System.out.println("\nDeleting Task ID 2:");
        boolean deleted = taskList.deleteTask(2);
        System.out.println(deleted ? "Deleted" : "Not Found");

        System.out.println("\nTasks After Deletion:");
        taskList.traverseTasks();
    }
}
