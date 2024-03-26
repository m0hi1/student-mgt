import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:splash_view/source/source.dart';
import 'package:splash_view/splash_view.dart';
import 'package:vidhyatri/src/features/auth/onboarding_view.dart';

import '../../shared/constants/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => context.pushReplacementNamed(onboardingRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashView(
      title: Text('Vidhyatri'),
      subtitle: Text('Created By Mohit'),
      backgroundColor: Colors.white,
      logo: Image(image: AssetImage('assets/images/mylogo.png')),
      loadingIndicator: CircularProgressIndicator(),
      bottomLoading: true,
      showStatusBar: false,
    );
  }
}
