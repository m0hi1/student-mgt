import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';
import '../model/student_model.dart';

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
        title: const Text('Student List'),
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
              Icons.arrow_back_outlined), // Adjust color for contrast
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder(
          valueListenable: _studentsBox.listenable(),
          builder: (context, Box<StudentModel> box, _) {
            if (box.values.isEmpty) {
              return const Center(
                child: Text('No students added yet.'),
              );
            } else {
              return ListView.builder(
                itemCount: box.values.length,
                itemBuilder: (context, index) {
                  StudentModel student = box.getAt(index)!;
                  return InkWell(
                     hoverColor: FlexColor.amberLightTertiary,
                    onTap: () {
                      context.push('/student_details', extra: student);
                    },
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/student.png'),
                      ),
                      title: Text(student.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 8),
                          Text('Roll No: ${student.roll}'),
                          const SizedBox(height: 8),
                          Text('Course: ${student.course}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete), // Delete icon
                        onPressed: () {
                          // Delete student from the box
                          box.delete(student.name);
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a screen to add a new student
          // You'll need to create this screen separately
          context.push('/createStudentFormPage');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
