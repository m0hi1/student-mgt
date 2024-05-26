import 'package:flutter/material.dart';
import 'package:vidhyatri/src/student/model/student_model.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: Fatch Eror'),
            Text('Roll No: Fetching failed}'),
            // Display other student details as needed
          ],
        ),
      ),
    );
  }
}
