import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbit/core/routes/router.gr.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5BA2F4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
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
                Image.asset(
                  "assets/getStart.png",
                  height: 280,
                  width: 280,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                //go to category.dart page

                ExtendedNavigator.root.push(Routes.category);
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
                      "let's get  ",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "started",
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
          ],
        ),
      ),
    );
  }
}
