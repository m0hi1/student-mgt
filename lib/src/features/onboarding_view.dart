import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:vidhyatri/src/shared/theme/services/theme_service_hive_adapters.dart';

import '../shared/constants/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        child: OnBoardingSlider(
          headerBackgroundColor: Colors.white,
          controllerColor: Colors.black,
          finishButtonText: 'Go',
          onFinish: () {
            context.goNamed(loginChoiceRoute);
          },
          finishButtonStyle: const FinishButtonStyle(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          skipTextButton: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          // trailing: const Text('Login'),
          background: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Lottie.asset(
                'assets/images/student2.json',
                fit: BoxFit.cover,
                height: 600,
                width: 350,
              ),
            ),
            Lottie.asset(
              'assets/images/student1.json',
              fit: BoxFit.cover,
              height: 550,
              width: 450,
            ),
          ],
          totalPage: 2,
          speed: 1,
          pageBodies: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 600,
                  ),
                  AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText(
                      "Welcome to our Student Management System! Whether you're an administrator, a student, or a teacher, our platform is designed to streamline your educational experience",
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      speed: const Duration(milliseconds: 15),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 600,
                  ),
                  AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText(
                      "With our user-friendly interface, educators can seamlessly navigate through attendance logs, assign homework, and share important notes, all in just a few clicks",
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      speed: Duration(milliseconds: 15),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
