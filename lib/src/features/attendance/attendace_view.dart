import 'package:flutter/material.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Attendance'),
      ),
    );
  }
}
