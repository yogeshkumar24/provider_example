
import 'package:provider_example/student/model/student_model.dart';

class StudentService {
  static Future<List<StudentModel>> fetchStudentData() async {
    List<StudentModel> studentList = [];
    await Future.delayed(const Duration(seconds: 2));
    studentList.add(StudentModel(name: "Dalip", rollNo: "100", age: 22));
    studentList.add(StudentModel(name: "Naresh", rollNo: "101", age: 21));
    studentList.add(StudentModel(name: "Kulbir", rollNo: "102", age: 23));
    return studentList;
  }



}
