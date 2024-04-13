import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/constants/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("OnBoarding Page"),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(loginChoiceRoute);
            },
            child: const Text('Go To Login'),
          ),
        ],
      ),
    );
  }
}
