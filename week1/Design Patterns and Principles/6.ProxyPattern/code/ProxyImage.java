package imageviewer;

public class ProxyImage implements Image {
    private String filename;
    private RealImage realImage;

    public ProxyImage(String filename) {
        this.filename = filename;
    }

    @Override
    public void display() {
        if (realImage == null) {
            realImage = new RealImage(filename);  // Lazy initialization
        } else {
            System.out.println("Image loaded from cache: " + filename);
        }
        realImage.display();
    }
}
