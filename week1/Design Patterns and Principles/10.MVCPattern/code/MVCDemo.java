package mvc;

public class MVCDemo {
    public static void main(String[] args) {
        // Create Model
        Student student = new Student();
        student.setName("Katta Jatadhara Sai");
        student.setId("0001");
        student.setGrade("A+");

        // Create View
        StudentView view = new StudentView();

        // Create Controller
        StudentController controller = new StudentController(student, view);

        // Display initial student info
        controller.updateView();

        // Update student info
        controller.setStudentGrade("A");
        controller.setStudentName("K.J.Sai");

        // Display updated student info
        controller.updateView();
    }
}
