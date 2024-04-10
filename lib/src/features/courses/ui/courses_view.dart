import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vidhyatri/src/features/courses/model/course_model.dart';
import 'package:vidhyatri/src/shared/boxes/hive_boxes.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  @override
  Widget build(BuildContext context) {
    final box = courseBox;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 212, 212),
      body: box.length != 0
          ? SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80, bottom: 50, left: 30),
                      child: Text(
                        'Courses',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textScaler: TextScaler.linear(2),
                      ),
                    ),
                    // const SizedBox(height: 70),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                              color: Colors.black,
                            ),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: box.length,
                                itemBuilder: (context, index) {
                                  final CourseModel course = box.getAt(index);

                                  if (box.length == 0) {
                                    return const Center(
                                      child: Text('No Courses'),
                                    );
                                  }
                                  return Card(
                                    color: Colors.transparent,
                                    child: ListTile(
                                      title: Text(
                                        course.title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        course.description,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          setState(() {
                                            box.delete(course.title);
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                })),
                      ],
                    ),
                  ]),
            )
          : const Center(
              child: Text(
                'No Courses Availble',
                textScaler: TextScaler.linear(2),
              ),
            ),
    );
  }
}
