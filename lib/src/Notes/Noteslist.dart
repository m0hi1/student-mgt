import 'package:flutter/material.dart';

class StudyMaterialList extends StatelessWidget {
  const StudyMaterialList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with your actual data source
    final List<Map<String, String>> notes = [
      {'title': 'Math Notes', 'description': 'Algebra and Geometry'},
      {'title': 'Physics Notes', 'description': 'Mechanics and Optics'},
      {'title': 'Chemistry Notes', 'description': 'Organic Chemistry'},
      // Add more notes here
    ];

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return ListTile(
          title: Text(note['title']!),
          subtitle: Text(note['description']!),
          onTap: () {
            // Handle note tap
          },
        );
      },
    );
  }
}
