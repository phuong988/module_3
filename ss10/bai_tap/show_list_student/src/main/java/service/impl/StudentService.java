package service.impl;

import model.Student;
import repository.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    public static final StudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> getAll() {
        return studentRepository.findAll();
    }

    @Override
    public void save(Student s) {
        studentRepository.saveStudent(s);
    }

    @Override
    public void update(int id, Object s) {

    }

    @Override
    public void remove(int id) {

    }

    @Override
    public Object findById(int id) {
        return null;
    }

    @Override
    public List<Student> findByName(String name) {
        return null;
    }

}
