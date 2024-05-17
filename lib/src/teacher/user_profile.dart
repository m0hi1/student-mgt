import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vidhyatri/src/utils/widgets/drawer_widget.dart';

import '../shared/constants/routes.dart';

class TeacherUserProfile extends ConsumerWidget {
  const TeacherUserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      drawer: const TeacherDrawerWidget(),
      body: ProfileScreen(
        actions: [
          SignedOutAction((context) {
            context.pushReplacementNamed(loginChoiceRoute);
          })
        ],
        children: const [],
      ),
    );
  }
}
