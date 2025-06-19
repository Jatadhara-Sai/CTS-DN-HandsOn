public class Main {
    public static void main(String[] args) {
        Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Shoes", "Footwear"),
                new Product(103, "Shirt", "Clothing"),
                new Product(104, "Pant", "Clothing"),
                new Product(105, "Phone", "Electronics"),
        };
        // Linear Search
        Product result1 = SearchAlgorithms.linearSearch(products, "Phone");
        System.out.println("Linear Search: " + (result1 != null ? result1 : "Not Found"));

        // Binary Search
        SearchAlgorithms.sortProductsByName(products);
        Product result2 = SearchAlgorithms.binarySearch(products, "Phone");
        System.out.println("Binary Search: " + (result2 != null ? result2 : "Not Found"));
    }
}
