package payment;

public class PayPalAdapter implements PaymentProcessor {
    private PayPalService paypal;

    public PayPalAdapter(PayPalService paypal) {
        this.paypal = paypal;
    }

    @Override
    public void processPayment(double amount) {
        paypal.makePayment(amount);
    }
}
