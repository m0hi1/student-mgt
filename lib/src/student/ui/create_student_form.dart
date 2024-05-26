import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

import '../../shared/boxes/hive_boxes.dart';
import '../model/student_model.dart';

class CreateStudentFormPage extends StatefulWidget {
  const CreateStudentFormPage({super.key});

  @override
  State<CreateStudentFormPage> createState() => _CreateStudentFormPageState();
}

class _CreateStudentFormPageState extends State<CreateStudentFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final Box box = studentBox;

  @override
  void dispose() {
    _nameController.dispose();
    _rollNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
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
                    'Enter Student Details',
                    textScaler: TextScaler.linear(2),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _rollNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Roll Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.isEmpty ||
                          _rollNumberController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the fields'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        box.put(
                          _nameController.text,
                          StudentModel(
                              name: _nameController.text,
                              roll: int.parse(_rollNumberController.text),
                              course: 'B.Tech/CSE'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Student Added Successfully'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 1),
                          ),
                        );
                        Timer(const Duration(seconds: 2), () {
                          context.go('/teacher-home');
                        });
                      }

                      _nameController.clear();
                      _rollNumberController.clear();
                    },
                    child: const Text('Add Student'),
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
