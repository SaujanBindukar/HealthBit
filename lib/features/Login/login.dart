import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbit/core/routes/router.gr.dart';

// ignore: must_be_immutable
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
      body: SafeArea(
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
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        labelText: "User ID",
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
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
                    onTap: () {
                      //go to category.dart page
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
                  widget.patient
                      ? InkWell(
                          onTap: () {
                            ExtendedNavigator.root.push(Routes.signUp,
                                arguments: SignUpArguments(patient: true));
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
                        )
                      : InkWell(
                          onTap: () {
                            ExtendedNavigator.root.push(Routes.signUp,
                                arguments: SignUpArguments(patient: false));
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
                                  "Register a Hospital?  ",
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
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
