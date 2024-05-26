import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
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
        backgroundColor: const Color.fromARGB(255, 226, 216, 216),
        shadowColor: Colors.white,
        centerTitle: true,
        title: const Text('Add Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SizedBox(
          height: 500,
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/images/course.json',
                    height: 100,
                    fit: BoxFit.cover,
                    // height: 50,
                    // width: 24,
                  ),
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
                      if (_title.text.isEmpty || _description.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the fields'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        box.put(
                          _title.text,
                          CourseModel(
                              title: _title.text,
                              description: _description.text),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Course Added Successfully'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 1),
                          ),
                        );
                        Timer(const Duration(seconds: 2), () {
                          context.go('/courses');
                        });
                      }

                      _title.clear();
                      _description.clear();
                    },
                    child: const Text('Add Course'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
