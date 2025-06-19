public class Book implements Comparable<Book> {
    int bookId;
    String title;
    String author;

    public Book(int bookId, String title, String author) {
        this.bookId = bookId;
        this.title = title;
        this.author = author;
    }

    public String toString() {
        return "Book ID: " + bookId + ", Title: " + title + ", Author: " + author;
    }

    // For binary search (compare by title)
    public int compareTo(Book other) {
        return this.title.compareToIgnoreCase(other.title);
    }
}
