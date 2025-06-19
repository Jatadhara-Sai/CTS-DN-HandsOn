public class Main {
    public static void main(String[] args) {
        Order[] orders = {
                new Order(101, "Alice", 250.75),
                new Order(102, "Bob", 99.99),
                new Order(103, "Charlie", 320.50),
                new Order(104, "Diana", 150.00)
        };

        // Clone array for separate sort
        Order[] bubbleSortedOrders = orders.clone();
        Order[] quickSortedOrders = orders.clone();

        System.out.println("Original Orders:");
        for (Order o : orders) System.out.println(o);

        System.out.println("\nSorted by Bubble Sort:");
        BubbleSort.sort(bubbleSortedOrders);
        for (Order o : bubbleSortedOrders) System.out.println(o);

        System.out.println("\nSorted by Quick Sort:");
        QuickSort.sort(quickSortedOrders, 0, quickSortedOrders.length - 1);
        for (Order o : quickSortedOrders) System.out.println(o);
    }
}
