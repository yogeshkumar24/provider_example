import 'package:flutter/material.dart';
import 'package:provider_example/teacher/model/teacher_model.dart';
import 'package:provider_example/teacher/service/teacher_service.dart';

class TeacherRecordScreenProvider extends ChangeNotifier{
  List<TeacherModel> teacherModelList = [];
  bool isLoading = false;

  Future fetchTeacherData()async{
    isLoading = true;
    notifyListeners();
    teacherModelList = await TeacherService.fetchTeacherData();
    isLoading = false;
    notifyListeners();
  }
}