import 'package:flutter/widgets.dart';
import 'package:provider_example/student/model/student_model.dart';
import 'package:provider_example/student/service/student_service.dart';


class StudentRecordScreenProvider extends ChangeNotifier{
  int counter = 0;
  List<StudentModel> studentList = [];
  bool isLoading = false;


  void incrementCounter() {
      counter++;
      notifyListeners();
  }

  Future fetchStudentData()async{
    isLoading = true;
    notifyListeners();
    studentList = await StudentService.fetchStudentData();
    isLoading = false;
    notifyListeners();
  }



}