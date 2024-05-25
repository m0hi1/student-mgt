import 'package:flutter/material.dart';
import 'package:vidhyatri/src/utils/widgets/drawer_widget.dart';

class ClassView extends StatelessWidget {
  const ClassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TeacherDrawerWidget(),
      appBar: AppBar(
        title: const Text("Class View"),
      ),
      body: const Center(
        child: Text("Class View"),
      ),
    );
  }
}
