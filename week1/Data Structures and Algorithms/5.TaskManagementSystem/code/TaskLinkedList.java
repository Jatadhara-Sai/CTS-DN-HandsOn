public class TaskLinkedList {
    private TaskNode head;

    // Add task to end
    public void addTask(Task task) {
        TaskNode newNode = new TaskNode(task);
        if (head == null) {
            head = newNode;
        } else {
            TaskNode current = head;
            while (current.next != null) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    // Search task by ID
    public Task searchTask(int id) {
        TaskNode current = head;
        while (current != null) {
            if (current.task.taskId == id) {
                return current.task;
            }
            current = current.next;
        }
        return null;
    }

    // Traverse and print all tasks
    public void traverseTasks() {
        TaskNode current = head;
        while (current != null) {
            System.out.println(current.task);
            current = current.next;
        }
    }

    // Delete task by ID
    public boolean deleteTask(int id) {
        if (head == null) return false;

        if (head.task.taskId == id) {
            head = head.next;
            return true;
        }

        TaskNode current = head;
        while (current.next != null) {
            if (current.next.task.taskId == id) {
                current.next = current.next.next;
                return true;
            }
            current = current.next;
        }

        return false;
    }
}
