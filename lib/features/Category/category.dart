import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbit/core/routes/router.gr.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5BA2F4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEALTH",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        color: Color(0xff585950),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "BIT",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "your healthy history",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
          Text(
            "Tell Us \n Who you are",
            style: GoogleFonts.poppins(
              fontSize: 50,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  ExtendedNavigator.root.push(Routes.login,
                      arguments: LoginArguments(
                        patient: true,
                      ));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Color(0xff585950),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I am a  ",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Patient",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xffE76F51),
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
              InkWell(
                onTap: () {
                  ExtendedNavigator.root.push(Routes.login,
                      arguments: LoginArguments(
                        patient: false,
                      ));
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
                        "Login As a  ",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Hospital",
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
          )
        ],
      ),
    );
  }
}
