import 'package:flutter/material.dart';
import 'package:vidhyatri/src/utils/widgets/drawer_widget.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TeacherDrawerWidget(),
      appBar: AppBar(
        title: const Text('Student View'),
      ),
      body: const Center(
        child: Text('This is the student view.'),
      ),
    );
  }
}
