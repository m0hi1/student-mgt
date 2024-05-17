import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../shared/boxes/hive_boxes.dart';
import '../model/student_model.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  Box box = studentBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final StudentModel student = box.getAt(index);
                  return Card(
                    child: ListTile(
                      title: Text(student.name),
                      subtitle: Text(student.roll.toString()),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            box.delete(student.name);
                          });
                        },
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class StudentListScreen extends StatefulWidget {
  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final _studentsBox = Hive.box<StudentModel>('students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _studentsBox.listenable(),
        builder: (context, Box<StudentModel> box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text('No students added yet.'),
            );
          } else {
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                StudentModel student = box.getAt(index)!;
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text('Roll No: ${student.roll}'),
                  // You can add more details like class and course here
                  // subtitle: Text('Class: ${student.class}, Course: ${student.course}'),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a screen to add a new student
          // You'll need to create this screen separately
          Navigator.pushNamed(context, '/add_student');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
