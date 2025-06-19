package imageviewer;

public class ImageViewerDemo {
    public static void main(String[] args) {
        Image image1 = new ProxyImage("forest.jpg");

        // First time: loads from server
        image1.display();

        System.out.println();

        // Second time: uses cached image
        image1.display();
    }
}
