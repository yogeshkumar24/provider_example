import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/shared/view/widget/info_row_widget.dart';
import 'package:provider_example/student/model/student_model.dart';
import 'package:provider_example/student/provider/home_screen_provider.dart';
import 'package:provider_example/teacher/view/screen/teacher_record_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StudentRecordScreenProvider _provider;

  @override
  void initState() {
    _provider = StudentRecordScreenProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ChangeNotifierProvider(
        create: (context) {
          return _provider;
        },
        builder: (context, child) {
          return Center(
            child: Consumer<StudentRecordScreenProvider>(
              builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      _provider.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherRecordScreen()),
                          );
                        },
                        child: const Text("Teacher Screen")),
                    _provider.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : studentListWidget(context),
                  ],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _provider.incrementCounter();
          _provider.fetchStudentData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  SizedBox studentListWidget(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: ListView.builder(
            itemCount: _provider.studentList.length,
            itemBuilder: (context, index) {
              StudentModel student = _provider.studentList[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InfoRawWidget(title: "Name:", value: student.name),
                  InfoRawWidget(title: "RollNo:", value: student.rollNo),
                  InfoRawWidget(title: "Age:", value: student.age.toString()),
                ],
              );
            }));
  }
}
