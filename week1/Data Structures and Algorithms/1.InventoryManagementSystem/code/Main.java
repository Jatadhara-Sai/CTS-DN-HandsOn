public class Main {
    public static void main(String[] args) {
        InventoryManager manager = new InventoryManager();

        manager.addProduct(new Product(101, "Keyboard", 10, 699.0));
        manager.addProduct(new Product(102, "Mouse", 20, 499.0));

        System.out.println("Inventory after addition:");
        manager.displayInventory();

        manager.updateProduct(101, 12, 749.0);
        System.out.println("\nInventory after update:");
        manager.displayInventory();

        manager.deleteProduct(102);
        System.out.println("\nInventory after deletion:");
        manager.displayInventory();
    }
}
