import 'dart:developer';
import 'package:firebase/data/auth_Helper.dart';
import 'package:firebase/views/screens/AppRouter.dart';
import 'package:firebase/views/widgets/custom_checkbox.dart';
import 'package:firebase/views/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:string_validator/string_validator.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordVisible = true;
  bool value = false;
  bool _confirmpasswordVisible = true;
  String? password(String? v) {
    if (v!.length < 6) {
      return 'password must be more than 6';
    }
  }

  String? confirmpass(String? v) {
    if (v != pass.text) {
      return 'password is not the same';
    }
  }

  String? userName(String? v) {
    if (v!.length < 4) {
      return 'UserName must be more than 4 letters';
    } else if (v.length > 8) {
      return "UserName must be less than 8 letters";
    }
  }

  String? emailValidator(String? v) {
    if (!isEmail(v!)) {
      return 'invalid email syntax';
    }
  }

  String? checkBoxValidator(bool? x) {
    if (!(x!)) {
      return 'you have to accept our conditions first';
    }
  }

  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _toggle2() {
    setState(() {
      _confirmpasswordVisible = !_confirmpasswordVisible;
    });
  }

  GlobalKey<FormState> registerKey = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Form(
            key: registerKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Stack(
                  children: [
                    Text(
                      "Fashions",
                      style: GoogleFonts.sacramento(
                          textStyle: TextStyle(
                              fontSize: 60.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 70, top: 60),
                        child: Text(
                          "My life My Style",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                          )),
                        )),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up ",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Create a new account ",
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "UserName ",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    TextFormField(
                      validator: userName,
                      controller: username
                    ),
                  ],
                ),
      
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    TextFormField(
                      validator: emailValidator,
                      controller: email,
                    ),
                  ],
                ),
      
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    TextFormField(
                      validator: password,
                      controller: pass,
                      onSaved: (val) => pass.text != val,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: _toggle,
                          child: _passwordVisible
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                  ],
                ),
      
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    TextFormField(
                      validator: confirmpass,
                      controller: confirmpassword,
                      onSaved: (val) => confirmpassword.text != val,
                      obscureText: _confirmpasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: _toggle2,
                          child: _confirmpasswordVisible
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                  ],
                ),
      
                SizedBox(
                  height: 10.h,
                ),
      
                CustomCheckbox(
                  validator: checkBoxValidator,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 340.w,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: () {
                        if (registerKey.currentState!.validate()) {
                          AuthHelper.authHelper.signUp(email.text, pass.text);
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       if (registerKey.currentState!.validate()) {
                //         AuthHelper.authHelper.signUp(email.text, pass.text);
                //       }
                //     },
                //     child: Text('Register')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
