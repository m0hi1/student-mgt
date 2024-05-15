import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/constants/routes.dart';

class LoginChoicePage extends StatefulWidget {
  const LoginChoicePage({super.key});

  @override
  State<LoginChoicePage> createState() => _LoginChoicePageState();
}

class _LoginChoicePageState extends State<LoginChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "What Describe You Best",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              // height: 150,
              width: 175,
              child: ElevatedButton(
                onPressed: () {
                  context.push(adminAuthRoute);
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                //child: const Text('Admin'),.

                child: SizedBox(
                  //height: 125,
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/images/student5.json',
                        height: 100,
                        fit: BoxFit.cover,
                        // height: 50,
                        // width: 24,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Admin'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              // height: 150,
              width: 175,
              child: ElevatedButton(
                onPressed: () {
                  context.push(teacherAuthRoute);
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                //child: const Text('Admin'),.

                child: SizedBox(
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/images/student4.json',
                        height: 100,
                        fit: BoxFit.cover,
                        // height: 50,
                        // width: 24,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Teacher',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              // height: 150,
              width: 175,
              child: ElevatedButton(
                onPressed: () {
                  context.push(studentAuthRoute);
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                //child: const Text('Admin'),.

                child: SizedBox(
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/images/student3.json',
                        height: 100,
                        fit: BoxFit.cover,
                        // height: 50,
                        // width: 24,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Student'),
                    ],
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 30),
            // ElevatedButton(
            //   onPressed: () {
            //     context.push(teacherAuthRoute);
            //   },
            //   child: const Text('Teacher'),
            // ),
            // const SizedBox(height: 30),
            // ElevatedButton(
            //   onPressed: () {
            //     context.push(studentAuthRoute);
            //   },
            //   child: const Text('Student'),
            // ),
          ],
        ),
      ),
    );
  }
}
