import 'dart:async';

import 'package:firebase/views/screens/FirstScreen.dart';
import 'package:firebase/views/screens/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    
    Timer(
      
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => FirstScreen())));
           
  }

  @override
  Widget build(BuildContext context) {
     print(MediaQuery.of(context).size.width);
             print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash2.jpeg"),
            fit: BoxFit.cover,
            opacity: .8,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fashions",
              style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                      fontSize: 65.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )
          ],
        )),
      ),
    );
  }
}
