import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iemcrp_new/Dashboard/Student/mark_attendence.dart';
import 'package:iemcrp_new/Dashboard/Student/viewAttendance.dart';
import 'package:iemcrp_new/Todo/TodoList.dart';
import 'package:iemcrp_new/Widgets/Buttons_small.dart';
import 'package:iemcrp_new/models/students.dart';
import 'package:iemcrp_new/screens/Routine/Routineview.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../screens/welcome/welcome_screen.dart';
import '../loading.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {

    final students=Provider.of<List<Student>?>(context);
    final user = Provider.of<IemcrpUser?>(context);
    var name="";
    String id="";
    var stream="";
    String enrollment="";
    void getStudentData() async {
      for (var student in students!) {
        if (student.id == user?.uid) {
          name = (student.name);
          enrollment = student.enrollment;
          stream = student.stream;
          id=student.id;
        }
      }
    }
    getStudentData();
    log("STUDENT-ID----"+ id);


    // print(students[0].);
      return students==null ? Loading():SingleChildScrollView(

        child: Center(
          child: Container(
            color: Colors.indigo.shade100,
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [



                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(width: 5),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Buttons_small(

                        Textcolor: Colors.indigo,
                        BackgroundColor: Colors.white,
                        text: 'Give Attendence',
                        ontap: () => Get.to(Mark_Attendence(),arguments: [stream,id]),
                        icon: Icons.mark_chat_read,
                        Iconcolor: Colors.red,
                        Iconsize: 35,
                        size: 150,
                      ),
                      Buttons_small(
                        ontap: (){Get.to(TodoList());},
                        Textcolor: Colors.indigo,
                        BackgroundColor: Colors.white,
                        text: 'Todo',
                        icon: Icons.list,
                        Iconcolor: Colors.purpleAccent,
                        Iconsize: 35,
                        size: 150,
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Buttons_small(
                        ontap: (){Get.to(ViewAttendance(),arguments: id);},
                        Textcolor: Colors.indigo,
                        BackgroundColor: Colors.white,
                        text: 'Check attendence',
                        icon: Icons.co_present,
                        Iconcolor: Colors.blue,
                        Iconsize: 35,
                        size: 150,
                      ),
                      Buttons_small(
                        ontap: (){Get.to(Routineview());},
                        Textcolor: Colors.indigo,
                        BackgroundColor: Colors.white,
                        text: 'Routine',
                        icon: Icons.schedule,
                        Iconcolor: Colors.yellow,
                        Iconsize: 35,
                        size: 150,
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Buttons_small(
                        Textcolor: Colors.indigo,
                        BackgroundColor: Colors.white,
                        text: 'Links',
                        icon: Icons.link,
                        Iconcolor: Colors.green,
                        Iconsize: 35,
                        size: 150,
                      ),
                      Buttons_small(
                        Textcolor: Colors.indigo,
                        BackgroundColor: Colors.white,
                        text: 'Materials',
                        icon: Icons.library_books,
                        Iconcolor: Colors.red,
                        Iconsize: 35,
                        size: 150,
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Buttons_small(
                        Textcolor: Colors.indigo,
                        BackgroundColor: Colors.white,
                        text: 'Fees',
                        icon: Icons.payment,
                        Iconcolor: Colors.cyanAccent,
                        Iconsize: 35,
                        size: 150,
                      ),
                      Buttons_small(
                        Textcolor: Colors.indigo,
                        BackgroundColor: Colors.white,
                        text: 'Marks',
                        icon: Icons.sports_score_outlined,
                        Iconcolor: Colors.blueGrey,
                        Iconsize: 35,
                        size: 150,
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }
}
