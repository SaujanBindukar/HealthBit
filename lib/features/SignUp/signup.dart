import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbit/core/components/custom_textfield.dart';
import 'package:healthbit/core/routes/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  bool patient;

  SignUp({
    Key key,
    this.patient,
  }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5BA2F4),
      body: SafeArea(
        child: widget.patient ? UserSignUp() : HospitalSignUp(),
      ),
    );
  }
}

class HospitalSignUp extends StatelessWidget {
  const HospitalSignUp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
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
                  "REQUEST NEW",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "HOSPITAL ",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: Color(0xff585950),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "ACCOUNT",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  labelText: "User ID",
                ),
                CustomTextField(
                  labelText: "Full Name",
                ),
                CustomTextField(
                  labelText: "Email",
                ),
                CustomTextField(
                  labelText: "Password",
                ),
                CustomTextField(
                  labelText: "Organization Name",
                ),
                CustomTextField(
                  labelText: "Phone Number",
                ),
                CustomTextField(
                  labelText: "Position",
                ),
                CustomTextField(
                  labelText: "Address",
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    ExtendedNavigator.root.push(Routes.login,
                        arguments: LoginArguments(patient: false));
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
                        "Send Request",
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
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    ExtendedNavigator.root.push(Routes.login,
                        arguments: LoginArguments(patient: false));
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
                          "Back to  ",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sign In",
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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserSignUp extends StatefulWidget {
  UserSignUp({
    Key key,
  }) : super(key: key);

  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
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
                  "REQUEST NEW",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "USER ",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: Color(0xff585950),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "ACCOUNT",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  labelText: "Email",
                  controller: emailController,
                ),
                CustomTextField(
                  labelText: "Password",
                  controller: passwordController,
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);

                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Register Successful.")));
                      ExtendedNavigator.root.push(Routes.login,
                          arguments: LoginArguments(
                            patient: true,
                          ));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content:
                                Text("The password provided is too weak.")));
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "The account already exists for that email.")));
                      }
                    } catch (e) {
                      print(e);
                    }

                    // ExtendedNavigator.root.push(Routes.login,
                    //     arguments: LoginArguments(patient: true));
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
                        "Send Request",
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
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    ExtendedNavigator.root.push(Routes.login,
                        arguments: LoginArguments(patient: true));
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
                          "Back to  ",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sign In",
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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
