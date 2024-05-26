import 'package:flutter/material.dart';
import 'package:vidhyatri/src/Notes/AddNotes.dart';
import 'package:vidhyatri/src/Notes/Notes_Search.dart';
import 'package:vidhyatri/src/Notes/Noteslist.dart';

class StudyMaterialPage extends StatelessWidget {
  final bool showAddButton;
  const StudyMaterialPage({Key? key, this.showAddButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Materials'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: NotesSearchDelegate());
            },
          ),
        ],
      ),
      body: const StudyMaterialList(),
      floatingActionButton: showAddButton
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNotePage()),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
