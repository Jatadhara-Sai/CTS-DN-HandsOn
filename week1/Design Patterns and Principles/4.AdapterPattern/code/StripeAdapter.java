package payment;

public class StripeAdapter implements PaymentProcessor {
    private StripeService stripe;

    public StripeAdapter(StripeService stripe) {
        this.stripe = stripe;
    }

    @Override
    public void processPayment(double amount) {
        stripe.payAmount(amount);
    }
}
