import 'package:flutter/material.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Courses')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Course Here'),
      ),
    );
  }
}
