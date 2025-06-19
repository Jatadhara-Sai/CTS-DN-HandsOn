package payment;

public class StripeService {
    public void payAmount(double amount) {
        System.out.println("Paid ₹" + amount + " using Stripe.");
    }
}

