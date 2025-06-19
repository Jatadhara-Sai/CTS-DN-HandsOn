package stockmarket;

public class StockMarketDemo {
    public static void main(String[] args) {
        StockMarket stockMarket = new StockMarket();

        Observer mobileApp = new MobileApp("InvestorPro");
        Observer webApp = new WebApp("StockTracker");

        stockMarket.registerObserver(mobileApp);
        stockMarket.registerObserver(webApp);

        stockMarket.setStockPrice("Cognizant", 3575.25);
        System.out.println();
        stockMarket.setStockPrice("Infosys", 1420.40);
    }
}
