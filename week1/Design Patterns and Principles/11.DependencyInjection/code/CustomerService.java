package customerapp;

public class CustomerService {
    private CustomerRepository customerRepository;

    // Constructor Injection
    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public void showCustomerDetails(String id) {
        String customerDetails = customerRepository.findCustomerById(id);
        System.out.println("Customer Details: " + customerDetails);
    }
}
