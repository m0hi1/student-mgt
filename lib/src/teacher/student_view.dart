import 'package:flutter/material.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student View'),
      ),
      body: const Center(
        child: Text('This is the student view.'),
      ),
    );
  }
}
