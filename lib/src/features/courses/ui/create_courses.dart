import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vidhyatri/src/features/courses/model/course_model.dart';
import 'package:vidhyatri/src/shared/boxes/hive_boxes.dart';

class CreateCourses extends StatefulWidget {
  const CreateCourses({super.key});

  @override
  State<CreateCourses> createState() => _CreateStudentFormPageState();
}

class _CreateStudentFormPageState extends State<CreateCourses> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final Box box = courseBox;

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Course',
              textScaler: TextScaler.linear(2),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _description,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                box.put(
                  _title.text,
                  CourseModel(
                      title: _title.text, description: _description.text),
                );
                _title.clear();
                _description.clear();
              },
              child: const Text('Add Course'),
            ),
          ],
        ),
      ),
    );
  }
}
