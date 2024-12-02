package repository;

import model.Student;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository {
    private static List<Student> students = new ArrayList<>();

    static {
        students.add(new Student(1, "Lê Viết Minh Phương ","Nam", 9f,"st2.webp", LocalDate.now()));
        students.add(new Student(2, "Trần Bắc Huyền","Nam", 8.5f,"image/tung.jfif", LocalDate.now()));
        students.add(new Student(3, "Kế Duyên","Nam", 9.7f,"image/c.jfif", LocalDate.now()));
        students.add(new Student(4, "Lâm Phong","Nam", 7.5f,"image/b.jfif", LocalDate.now()));
    }

    public List<Student> findAll() {
        return students;

    }

    public void saveStudent(Student s) {
        s.setId(students.get(students.size()-1).getId() + 1);
        students.add(s);
    }
}
