package notifier;

public class NotificationDemo {
    public static void main(String[] args) {
        Notifier baseNotifier = new EmailNotifier();

        // Add SMS and Slack notification functionality dynamically
        Notifier multiChannelNotifier = new SlackNotifierDecorator(
                new SMSNotifierDecorator(baseNotifier));

        multiChannelNotifier.send("System will undergo maintenance at 10 PM.");
    }
}
