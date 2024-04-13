import 'package:flutter/material.dart';

class ClassView extends StatelessWidget {
  const ClassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class View"),
      ),
      body: const Center(
        child: Text("Class View"),
      ),
    );
  }
}
