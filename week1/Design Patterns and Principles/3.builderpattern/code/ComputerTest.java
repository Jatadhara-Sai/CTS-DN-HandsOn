package builderpattern;

public class ComputerTest {
    public static void main(String[] args) {
        Computer basicComputer = new Computer.Builder("Intel i3", "4GB")
                .build();

        Computer gamingComputer = new Computer.Builder("Intel i9", "32GB")
                .setStorage("2TB SSD")
                .setGraphicsCard("NVIDIA RTX 4090")
                .build();

        System.out.println("Basic Computer Configuration:");
        basicComputer.displayConfiguration();

        System.out.println("\nGaming Computer Configuration:");
        gamingComputer.displayConfiguration();
    }
}
