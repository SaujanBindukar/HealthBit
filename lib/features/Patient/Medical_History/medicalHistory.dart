import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbit/core/components/custom_medicalRecords.dart';

class MedicalHistory extends StatefulWidget {
  MedicalHistory({Key key}) : super(key: key);

  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5BA2F4),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.chevron_left,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Medical history",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/profile.png",
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kiran Pradhan",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "UserId",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //Medical record list

                CustomMedicalRecords(
                  recordId: "001",
                  doctorName: "Mr. Doctor",
                  hospitalName: "Hospital Name",
                  description:
                      "Patient was diagnosed with diarrhea and STDs of all kinds.",
                  otherPrescription: "Stay away from cold foods.",
                  medicine: "D-cold",
                ),

                CustomMedicalRecords(
                  recordId: "001",
                  doctorName: "Mr. Doctor",
                  hospitalName: "Hospital Name",
                  description:
                      "Patient was diagnosed with diarrhea and STDs of all kinds.",
                  otherPrescription: "Stay away from cold foods.",
                  medicine: "D-cold",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
