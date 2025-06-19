package customerapp;

public class DITest {
    public static void main(String[] args) {
        // Inject dependency via constructor
        CustomerRepository repository = new CustomerRepositoryImpl();
        CustomerService service = new CustomerService(repository);

        service.showCustomerDetails("C001");
    }
}
