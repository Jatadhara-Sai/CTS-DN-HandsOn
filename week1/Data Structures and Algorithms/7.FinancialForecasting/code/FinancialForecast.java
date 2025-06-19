public class FinancialForecast {

    // Recursive method
    public static double forecast(double currentValue, double growthRate, int years) {
        // Base case: no growth
        if (years == 0) {
            return currentValue;
        }

        // Recursive case: apply growth for one year
        return forecast(currentValue, growthRate, years - 1) * (1 + growthRate);
    }

    public static void main(String[] args) {
        double initialValue = 10000;
        double growthRate = 0.05; // 5% annual growth
        int years = 5;

        double futureValue = forecast(initialValue, growthRate, years);
        System.out.printf("Future Value after %d years: %.2f%n", years, futureValue);
    }
}
