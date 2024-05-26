import 'package:flutter/material.dart';

class NotesSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Replace with your actual search logic
    final List<Map<String, String>> notes = [
      {'title': 'Math Notes', 'description': 'Algebra and Geometry'},
      {'title': 'Physics Notes', 'description': 'Mechanics and Optics'},
      {'title': 'Chemistry Notes', 'description': 'Organic Chemistry'},
    ];
    final results = notes
        .where((note) =>
            note['title']!.toLowerCase().contains(query.toLowerCase()) ||
            note['description']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final note = results[index];
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

  @override
  Widget buildSuggestions(BuildContext context) {
    // Replace with your actual search logic
    final List<Map<String, String>> notes = [
      {'title': 'Math Notes', 'description': 'Algebra and Geometry'},
      {'title': 'Physics Notes', 'description': 'Mechanics and Optics'},
      {'title': 'Chemistry Notes', 'description': 'Organic Chemistry'},
    ];
    final results = notes
        .where((note) =>
            note['title']!.toLowerCase().contains(query.toLowerCase()) ||
            note['description']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final note = results[index];
        return ListTile(
          title: Text(note['title']!),
          subtitle: Text(note['description']!),
          onTap: () {
            query = note['title']!;
            showResults(context);
          },
        );
      },
    );
  }
}
