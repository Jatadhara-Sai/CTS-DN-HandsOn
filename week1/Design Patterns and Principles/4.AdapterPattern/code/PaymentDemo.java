package payment;

public class PaymentDemo {
    public static void main(String[] args) {
        PaymentProcessor paypalProcessor = new PayPalAdapter(new PayPalService());
        paypalProcessor.processPayment(2500.0);

        PaymentProcessor stripeProcessor = new StripeAdapter(new StripeService());
        stripeProcessor.processPayment(3200.0);
    }
}
