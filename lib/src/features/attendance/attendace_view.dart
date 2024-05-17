import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vidhyatri/src/features/attendance/attendance_model.dart';
import 'package:vidhyatri/src/student/model/student_model.dart';

class AttendanceViewingScreen extends StatefulWidget {
  @override
  _AttendanceViewingScreenState createState() =>
      _AttendanceViewingScreenState();
}

class _AttendanceViewingScreenState extends State<AttendanceViewingScreen> {
  final _studentsBox = Hive.box<StudentModel>('students');
  final _attendanceBox = Hive.box<AttendanceModel>('attendance');

  String? selectedCourse;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _loadAttendanceData();
  }

  void _loadAttendanceData() {
    // Logic to load initial attendance data if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Attendance'),
      ),
      body: Column(
        children: [
          // Course Filter
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCourse,
              hint: Text('Select Course'),
              onChanged: (newValue) {
                setState(() {
                  selectedCourse = newValue;
                });
              },
              items: _attendanceBox.values
                  .map((attendance) => attendance.course)
                  .toSet()
                  .map((course) => DropdownMenuItem(
                        value: course,
                        child: Text(course),
                      ))
                  .toList(),
            ),
          ),

          // Date Picker
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(selectedDate != null
                    ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                    : 'Select Date'),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != selectedDate)
                      setState(() {
                        selectedDate = picked;
                      });
                  },
                ),
              ],
            ),
          ),

          // Attendance List
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _attendanceBox.listenable(),
              builder: (context, Box<AttendanceModel> attendanceBox, _) {
                final filteredAttendance = attendanceBox.values.where((a) {
                  final matchesCourse =
                      selectedCourse == null || a.course == selectedCourse;
                  final matchesDate = selectedDate == null ||
                      a.date.year == selectedDate!.year &&
                          a.date.month == selectedDate!.month &&
                          a.date.day == selectedDate!.day;
                  return matchesCourse && matchesDate;
                }).toList();

                if (filteredAttendance.isEmpty) {
                  return Center(
                    child: Text('No attendance data found.'),
                  );
                }

                return ListView.builder(
                  itemCount: filteredAttendance.length,
                  itemBuilder: (context, index) {
                    final attendance = filteredAttendance[index];
                    return AttendanceCard(
                      attendance: attendance,
                      studentsBox: _studentsBox,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final AttendanceModel attendance;
  final Box<StudentModel> studentsBox;

  const AttendanceCard(
      {Key? key, required this.attendance, required this.studentsBox})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course: ${attendance.course}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${DateFormat('yyyy-MM-dd').format(attendance.date)}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Present Students:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            ...attendance.presentStudentKeys.map((studentKey) {
              final student = studentsBox.get(studentKey);
              return student != null
                  ? Text(
                      '- ${student.name} (Roll No: ${student.roll})',
                      style: TextStyle(fontSize: 14),
                    )
                  : SizedBox.shrink(); // Skip if student not found
            }).toList(),
          ],
        ),
      ),
    );
  }
}
