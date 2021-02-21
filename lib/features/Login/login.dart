import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbit/core/routes/router.gr.dart';

import '../../core/routes/router.gr.dart';

class Login extends StatefulWidget {
  bool patient;

  Login({Key key, this.patient}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5BA2F4),
      body: LoginBody(
        patient: widget.patient,
      ),
    );
  }
}

class LoginBody extends StatefulWidget {
  bool patient;

  LoginBody({Key key, this.patient}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: () {
                  ExtendedNavigator.root.push(Routes.category);
                },
                child: Icon(
                  Icons.chevron_left,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Back",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: emailController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        labelText: "Email",
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: passwordController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        labelText: "Password",
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        print(userCredential);
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Login Successful.")));
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(userCredential.user.uid)
                            .get()
                            .then((value) {
                          bool isPatient = value.get("isPatient") == 'true';

                          isPatient
                              ? ExtendedNavigator.root.pushAndRemoveUntil(
                                  Routes.patientProfile, (route) => false,
                                  arguments: PatientProfileArguments(
                                      user: userCredential.user))
                              : ExtendedNavigator.root.pushAndRemoveUntil(
                                  Routes.hospitalScreen, (route) => false,
                                  arguments: HospitalScreenArguments(
                                      user: userCredential.user));
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("No user found for that email.")));
                        } else if (e.code == 'wrong-password') {
                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Wrong password provided for that user.")));
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Color(0xff585950),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In ",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      ExtendedNavigator.root.pushAndRemoveUntil(
                        Routes.signUp,
                        (route) => false,
                        arguments: SignUpArguments(patient: widget.patient),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Request an Account?  ",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Signup",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Color(0xff585950),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
