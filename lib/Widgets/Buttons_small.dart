import 'package:flutter/material.dart';

class Buttons_small extends StatelessWidget {
  final Color Textcolor;
  final Color BackgroundColor;
  final Color Iconcolor;
  double Iconsize;
  final String text;
  final IconData icon;
  double size;

  final VoidCallback? ontap;

  Buttons_small({
    Key? key,
    required this.Textcolor,
    required this.BackgroundColor,
    required this.text,
    required this.icon,
    required this.size,
    required this.Iconsize,
     this.ontap, required this.Iconcolor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(


        width: size,
        height: size,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: Iconcolor,size: Iconsize,),
              Text(text,style: TextStyle(color: Textcolor),),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: BackgroundColor,
          borderRadius: BorderRadius.circular(0),

          boxShadow: [
            BoxShadow(
              color: Color(0xFF0040c2).withOpacity(0.3),
              offset: const Offset(
                2.0,
                2.0,
              ),
              blurRadius: 2.0,
              spreadRadius: 3.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 2.0,
            ), //BoxShadow
          ],
        ),

      ),
    );
  }
}
