import 'package:provider_example/teacher/model/teacher_model.dart';

class TeacherService {
  static Future<List<TeacherModel>> fetchTeacherData() async {
    List<TeacherModel> teacherList = [];
    await Future.delayed(const Duration(seconds: 2));
    teacherList.add(
        TeacherModel(teacherName: 'Dinesh', salary: 10000, subject: "Flutter"));
    teacherList.add(
        TeacherModel(teacherName: 'Manish', salary: 12000, subject: "Java"));
    teacherList.add(
        TeacherModel(teacherName: 'Yogesh', salary: 10400, subject: "Kotlin"));
    return teacherList;
  }
}
