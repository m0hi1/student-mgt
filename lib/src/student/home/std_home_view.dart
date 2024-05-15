import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import '../../shared/theme/const/theme_color.dart';
import '../../utils/widgets/drawer_widget.dart';

class StdHomeView extends StatelessWidget {
  const StdHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student App')),
      drawer: const StudentDrawerWidget(),
      body: getBody(context),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset('assets/images/mylogo.png'),
      //       Text(
      //         'Welcome!',
      //         style: Theme.of(context).textTheme.displaySmall,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget getBody(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Student's",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 145,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: ThemeColor.shadow,
                        blurRadius: 100,
                        spreadRadius: 5,
                        offset: Offset(0, 25),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: ThemeColor.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: (size.width),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Mohit Chauhan",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.white,
                                  ),
                                ),
                                const Text(
                                  "B.TECH/CSE/A1",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColor.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 100,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: ThemeColor.secondary,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Text(
                                        "Report",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: ThemeColor.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColor.secondary,
                          ),
                          child: const Center(
                              child: Text(
                            '80%',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: ThemeColor.white,
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Container(
                //   width: double.infinity,
                //   height: 60,
                //   decoration: BoxDecoration(
                //       boxShadow: const [
                //         BoxShadow(
                //             color: ThemeColor.shadow,
                //             blurRadius: 10,
                //             spreadRadius: 0.1,
                //             offset: Offset(0, 10)),
                //       ],
                //       color: ThemeColor.white,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 20, right: 20),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         const Text(
                //           "Create Class",
                //           style: TextStyle(
                //               fontSize: 17,
                //               color: ThemeColor.black,
                //               fontWeight: FontWeight.w600),
                //         ),
                //         InkWell(
                //           onTap: () {},
                //           child: Container(
                //             width: 70,
                //             height: 35,
                //             decoration: BoxDecoration(
                //                 color: ThemeColor.secondary,
                //                 borderRadius: BorderRadius.circular(20)),
                //             child: const Center(
                //               child: Icon(LineIcons.plus, color: Colors.white),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
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
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "View Classes",
                          style: TextStyle(
                              fontSize: 17,
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 70,
                            height: 35,
                            decoration: BoxDecoration(
                                color: ThemeColor.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Icon(LineIcons.arrowRight,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: (size.width / 2.5),
                        height: (size.width / 2.5),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: ThemeColor.shadow,
                                  blurRadius: 10,
                                  spreadRadius: 0.1,
                                  offset: Offset(0, 10)),
                            ],
                            // color: ThemeColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 1,
                            ),
                            Icon(
                              LineIcons.chevronUp,
                              size: 50,
                              color: ThemeColor.primary,
                            ),
                            Text(
                              "Results",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // context.go(location);
                      },
                      child: Container(
                        width: (size.width / 2.5),
                        height: (size.width / 2.5),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: ThemeColor.shadow,
                                  blurRadius: 10,
                                  spreadRadius: 0.1,
                                  offset: Offset(0, 10)),
                            ],
                            // color: ThemeColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 1,
                            ),
                            Icon(
                              LineIcons.question,
                              size: 50,
                              color: ThemeColor.primary,
                            ),
                            Text(
                              "View Queries",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
