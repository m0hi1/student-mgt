import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

import '../../shared/theme/const/theme_color.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "B.Tech/CSE/A1",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Students',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.pop(context);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Icon(LineIcons.arrowLeft),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedList(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, animation, index) {
                return Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: ThemeColor.shadow,
                                  blurRadius: 10,
                                  spreadRadius: 0.1,
                                  offset: Offset(0, 10)),
                            ],
                            color: ThemeColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 2),
                          child: ListTile(
                            trailing: InkWell(
                              onTap: () {
                                // database.child(userID).remove();
                              },
                              child: Container(
                                width: 70,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: ThemeColor.secondary,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                  child: Icon(LineIcons.trash,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            title: const Text(
                              "List here",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ))
                ]);
              })
        ]),
      ),
    )));
  }
}
