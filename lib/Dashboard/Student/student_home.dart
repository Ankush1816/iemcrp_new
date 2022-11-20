import 'package:flutter/material.dart';
import 'package:iemcrp_new/Dashboard/Student/student_profile.dart';
import 'package:iemcrp_new/models/students.dart';
import 'package:iemcrp_new/services/auth.dart';
import 'package:iemcrp_new/services/datasbase.dart';
import 'package:provider/provider.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Student>?>.value(
      value: DatabaseService().students,
      initialData: null,
      catchError: (_, __) => null,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text('Iemcrp'),
            actions: <Widget>[
              TextButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await _auth.signOut();
                },
                label: Text('logout', style: TextStyle(color: Colors.white)),
              )
            ]),
        drawer: Drawer(
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Image.network(
                    'https://media.istockphoto.com/id/1139459625/photo/silhouette-of-man-in-dark-place-anonymous-backlit-contour-a.jpg?b=1&s=170667a&w=0&k=20&c=FvcYQyr8xlRzVHrYb3IsksCwDfTucVTQfOM_kq7whHI=',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                child: Column(
                  children: [
                    Text("Name-Test Student",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text("Stream-CSE",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text("Sec-A",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text("Roll-100",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text("Enr- 1202000201700945",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text("Reg no-3239y34y34rrd",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: StudentProfile(),
      ),
    );
  }
}
