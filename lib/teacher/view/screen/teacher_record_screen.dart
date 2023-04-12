import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/shared/view/widget/info_row_widget.dart';
import 'package:provider_example/teacher/model/teacher_model.dart';
import 'package:provider_example/teacher/provider/teacher_record_screen_provider.dart';

class TeacherRecordScreen extends StatefulWidget {
  const TeacherRecordScreen({Key? key}) : super(key: key);

  @override
  State<TeacherRecordScreen> createState() => _TeacherRecordScreenState();
}

class _TeacherRecordScreenState extends State<TeacherRecordScreen> {
  late TeacherRecordScreenProvider _provider;

  @override
  void initState() {
    _provider = TeacherRecordScreenProvider();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _provider.fetchTeacherData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) {
          return _provider;
        },
        builder: (context, child) {
          return Consumer<TeacherRecordScreenProvider>(
              builder: (context, provider, child) {
            return listWidget();
          });
        },
      ),
    );
  }

  Widget listWidget() {
    return ListView.builder(
        itemCount: _provider.teacherModelList.length,
        itemBuilder: (context, index) {
          TeacherModel teacherModel = _provider.teacherModelList[index];
          return Column(
            children: [
              InfoRawWidget(title: "Name:", value: teacherModel.teacherName),
              InfoRawWidget(
                  title: "Salary:", value: teacherModel.salary.toString()),
              InfoRawWidget(title: "Subject:", value: teacherModel.subject),
            ],
          );
        });
  }
}
