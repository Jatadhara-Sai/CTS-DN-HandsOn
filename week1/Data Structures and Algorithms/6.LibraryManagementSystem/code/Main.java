import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Book[] books = {
                new Book(101, "Java Programming", "James Gosling"),
                new Book(102, "Python Basics", "Guido van Rossum"),
                new Book(103, "C++ Primer", "Stanley Lippman"),
                new Book(104, "Effective Java", "Joshua Bloch")
        };

        System.out.println("Searching for 'Python Basics' using Linear Search:");
        Book result1 = LibrarySearch.linearSearch(books, "Python Basics");
        System.out.println(result1 != null ? result1 : "Book not found");

        // Sort before binary search
        Arrays.sort(books);

        System.out.println("\nSearching for 'Python Basics' using Binary Search:");
        Book result2 = LibrarySearch.binarySearch(books, "Python Basics");
        System.out.println(result2 != null ? result2 : "Book not found");
    }
}
