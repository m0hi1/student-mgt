import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vidhyatri/src/admin/admin_view.dart';
import 'package:vidhyatri/src/features/onboarding_view.dart';
import 'package:vidhyatri/src/features/courses/ui/courses_view.dart';
import 'package:vidhyatri/src/features/courses/ui/create_courses.dart';
import '../features/attendance/attendace_view.dart';
import '../features/auth/views/admin_auth_gate.dart';
import '../features/auth/views/choice_login.dart';
import '../features/auth/views/student_auth_gate.dart';
import '../features/auth/views/teacher_auth_gate.dart';
import '../features/bottom_nav_bar.dart';
import '../features/profile/user_profile.dart';
import '../shared/constants/routes.dart';
import '../student/std_home_view.dart';
import '../student/ui/create_student_form.dart';
import '../student/ui/student_list_page.dart';
import '../teacher/class_view.dart';
import '../teacher/student_view.dart';
part 'router.g.dart';

// This is the router provider that will be used in the main.dart file
// to pass the router to the MaterialApp.router
@riverpod
GoRouter router(RouterRef ref) {
  // final userRoleProvider = ref.watch(userRoleProvider);

  final rootNavigatorKey = GlobalKey<NavigatorState>();
  // final adminNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'admin');
  // final studentNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'student');
  // final teacherNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');
  final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
  final courseNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'course');
  final attendanceNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'attendance');
  final profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');
  final tProfileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

  return GoRouter(
    navigatorKey: rootNavigatorKey,

    initialLocation: onboardingRoute,

    /// Forwards diagnostic messages to the dart:developer log() API.
    debugLogDiagnostics: true,
    //* temporary solution for checking if user is logged in or not and where to send him
    // redirect: (context, state) {
    //   if (state.uri.toString() == splashRoute) {
    //     return studentRoute;
    //   }
    //   return loginChoiceRoute;
    // },
    //  redirect: (context, state) async {
    //     final role =
    //         await userRoleProvider.future; // Get user role asynchronously

    //     if (role == null) {
    //       // User not logged in, redirect to login choice
    //       return loginChoiceRoute;
    //     }

    //     switch (role) {
    //       case UserRole.admin:
    //         return state.location == adminAuthRoute ||
    //                 state.location == loginChoiceRoute
    //             ? null // Allow access to admin auth gate or login choice if already there
    //             : adminAuthRoute; // Otherwise, redirect to admin auth gate
    //       case UserRole.teacher:
    //         return state.location == teacherAuthRoute ||
    //                 state.location == loginChoiceRoute
    //             ? null
    //             : teacherAuthRoute;
    //       case UserRole.student:
    //         return state.location == studentAuthRoute ||
    //                 state.location == loginChoiceRoute
    //             ? null
    //             : studentAuthRoute;
    //       default:
    //         return null; // Handle unexpected roles (if any)
    //     }
    //   },
    routes: [
      GoRoute(
        path: onboardingRoute,
        builder: (context, state) => const AdminHomePage(),
        name: onboardingRoute,
      ),

      ///--------------------------------------------Auth---------------------------------------------------------///

      GoRoute(
        path: loginChoiceRoute,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginChoicePage(),
        ),
        name: loginChoiceRoute,
      ),

      /// Define routes based on user role
      GoRoute(
        path: adminAuthRoute,
        builder: (context, state) {
          return const AdminAuthGate();
        },
        name: adminAuthRoute,
      ),
      GoRoute(
        path: teacherAuthRoute,
        builder: (context, state) {
          return const TeacherAuthGate();
        },
        name: teacherAuthRoute,
      ),
      GoRoute(
        path: studentAuthRoute,
        builder: (context, state) {
          return const StudentAuthGate();
        },
        name: studentAuthRoute,
      ),

      ///-----------Student--------------------BottomNavBar---------------------------------------------------///

      StatefulShellRoute.indexedStack(
        builder: (context, state, studentNavigationShell) {
          return StudentNavigationBottomBar(
            navigationShell: studentNavigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigatorKey,
            routes: [
              GoRoute(
                path: studentRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: StdHomeView(),
                ),
                name: studentRoute,
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: courseNavigatorKey,
            routes: [
              GoRoute(
                path: courseRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: CoursesView(),
                ),
                name: courseRoute,
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: attendanceNavigatorKey,
            routes: [
              GoRoute(
                path: attendanceRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: AttendanceView(),
                ),
                name: attendanceRoute,
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: profileNavigatorKey,
            routes: [
              GoRoute(
                path: userProfileRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: UserProfile(),
                ),
                name: userProfileRoute,
              ),
            ],
          ),
        ],
      ),

      ///-----------Teacher--------------------BottomNavBar---------------------------------------------------///

      StatefulShellRoute.indexedStack(
        builder: (context, state, teacherNavigationShell) {
          return TeacherNavigationBottomBar(
            navigationShell: teacherNavigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            // navigatorKey: homeNavigatorKey,
            routes: [
              GoRoute(
                path: teacherRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: StdHomeView(),
                ),
                name: teacherRoute,
              ),
            ],
          ),
          StatefulShellBranch(
            // navigatorKey: courseNavigatorKey,
            routes: [
              GoRoute(
                path: classRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ClassView(),
                ),
                name: classRoute,
              ),
            ],
          ),
          StatefulShellBranch(
            // navigatorKey: attendanceNavigatorKey,
            routes: [
              GoRoute(
                path: studentViewRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: StudentView(),
                ),
                name: studentViewRoute,
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: tProfileNavigatorKey,
            routes: [
              GoRoute(
                path: userProfileRoute,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: UserProfile(),
                ),
                // name: userProfileRoute,
              ),
            ],
          ),
        ],
      ),

      ///-----------------------------------Misc..--------------------------------------------------------///

      GoRoute(
        path: '/createStudentFormPage',
        name: 'createStudentFormPage',
        builder: (context, state) => const CreateStudentFormPage(),
      ),
      GoRoute(
        path: '/studentListPage',
        name: 'studentListPage',
        builder: (context, state) => const StudentListPage(),
      ),
      GoRoute(
        path: '/createCourses',
        name: 'createCourses',
        builder: (context, state) => const CreateCourses(),
      ),
      GoRoute(
        path: '/coursesView',
        name: 'coursesView',
        builder: (context, state) => const CoursesView(),
      ),
      GoRoute(
        path: '/admin',
        name: 'admin',
        builder: (context, state) => const AdminHomePage(),
      ),

      // GoRoute(
      //   path: SettingsView.path,
      //   name: SettingsView.path,
      //   builder: (context, state) =>
      //       SettingsView(controller: settingsController),
      // ),
    ],

    //*if page not found then it will show the page not found from here.
    errorBuilder: (context, state) => const Center(
      child: Scaffold(body: Text("Page Not Found")),
    ),
  );
}
