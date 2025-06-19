package stockmarket;

public class WebApp implements Observer {
    private String siteName;

    public WebApp(String siteName) {
        this.siteName = siteName;
    }

    @Override
    public void update(String stockName, double price) {
        System.out.println(siteName + " (Web App) received update: " + stockName + " is now ₹" + price);
    }
}
