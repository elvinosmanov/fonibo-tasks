import 'package:flutter/material.dart';
import 'package:fonibo_task/models/task_model.dart';
import 'package:fonibo_task/views/ui/task/task_controller.dart';
import 'package:fonibo_task/views/utils/constants.dart';
import 'package:fonibo_task/views/utils/widgets/custom_list.dart';
import 'package:intl/intl.dart';

class TaskView extends StatefulWidget {
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  TaskController _taskController = TaskController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.view_headline,
          color: Constants.colorBlue,
          size: 25.0,
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'task.',
          style: TextStyle(
              color: Constants.colorBlue,
              fontSize: 22.0,
              fontWeight: FontWeight.w900),
        ),
      ),
      body: FutureBuilder(
        future: _taskController.fetchAllTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            List<TaskModel> tasks = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
                  child: Text(
                    'Tasks',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        DateTime date = DateTime.parse(tasks[index].createdAt);
                        print(date);
                        return CustomList(
                          color: Constants.colors[index % 4],
                          title: tasks[index].title,
                          createdAt: DateFormat('MMM dd, hh:mm a').format(date),
                        );
                      }),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Constants.colorBlue,
          size: 36.0,
        ),
      ),
    );
  }
}
