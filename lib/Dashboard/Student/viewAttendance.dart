import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../loading.dart';
import 'attendance_slider.dart';

class ViewAttendance extends StatefulWidget {
  const ViewAttendance({Key? key}) : super(key: key);

  @override
  State<ViewAttendance> createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  @override
  String id = Get.arguments;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Daily Attendance Report"),
      ),
      body: AttendanceSlider(id:id),
    );
  }
}
