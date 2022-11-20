import 'package:flutter/material.dart';
import 'package:iemcrp_new/Dashboard/Admin/admin.dart';
import 'package:iemcrp_new/Dashboard/loading.dart';
import 'package:iemcrp_new/services/auth.dart';
import 'package:iemcrp_new/shared/constants.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth=AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading= false;


  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Iemcrp'),
      ),
      body: SingleChildScrollView(
        child: Container(

          //Sign In Anonymously
          // child: TextButton(
          //   onPressed: () async{
          //     dynamic result = await _auth.signInAnom();
          //     if(result==null){
          //       print("error signing in");
          //     }
          //     else{
          //       print(result.uid);
          //     }
          //   },
          //   child: Text('Sign In Anom'),
          // ),

          //Sign in with email and password
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18,top: 80),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("Login",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                    SizedBox(height: 20),

                    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9J5G1JzBWiw145OB12tqdv7RMbia35ed2v8FOf1rdMAi74bonvo2ZdygJsieZhsQ0MXw&usqp=CAU",height: 100,),
                    SizedBox(height: 40),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) =>
                      val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey ,
                        shadowColor: Colors.indigo
                      ),
                      child: Text('Log in',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          // log(email);
                          // log(password);
                          dynamic result = await _auth.signInWithEmailAndPassword(
                              email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Could not sign in with those credentials';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    Text(error, style: TextStyle(color: Colors.red, fontSize: 14)),

                    //temporary route
                    // TextButton(onPressed: (){
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const Admin()),
                    //   );
                    // }, child: Text("Admin"))
                  ],
                )),
          ),

        ),
      ),
    );
  }
}
