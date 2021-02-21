import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbit/core/routes/router.gr.dart';
import 'package:healthbit/core/utils/color.dart';

class HospitalScreen extends StatefulWidget {
  User user;
  HospitalScreen({Key key, this.user}) : super(key: key);

  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.primaryColor,
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(widget.user.uid)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data.data();
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/profile.png",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${data['firstName']} ${data['lastName']}",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Text(
                          "User ID:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${widget.user.uid}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Email:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${widget.user.email}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Phone:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${data['phone']}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ExtendedNavigator.root.push(Routes.newRecord);
                      },
                      child: Text("Add Patient"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ExtendedNavigator.root.push(Routes.userQRScannerPage,
                            arguments:
                                UserQRScannerPageArguments(shouldPop: false));
                      },
                      child: Text("Scan QR"),
                    ),
                  ],
                ),
              );
            }

            return Text("loading");
          },
        ),
      ),
    );
  }
}
