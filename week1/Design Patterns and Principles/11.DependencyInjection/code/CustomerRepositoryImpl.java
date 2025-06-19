package customerapp;

public class CustomerRepositoryImpl implements CustomerRepository {

    @Override
    public String findCustomerById(String id) {
        // Simulated data
        return "Customer[ID=" + id + ", Name= Katta Jatadhara Sai]";
    }
}
