import 'package:flutter/material.dart';
import 'package:fonibo_task/views/ui/task/task_view.dart';
import 'package:fonibo_task/views/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Constants.colorBlue,
      ),
      home: TaskView(),
    );
  }
}
