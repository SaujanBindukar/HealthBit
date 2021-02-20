import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMedicalRecords extends StatelessWidget {
  String recordId;
  String hospitalName;
  String doctorName;
  String description;
  String medicine;
  String otherPrescription;
  CustomMedicalRecords({
    Key key,
    this.recordId,
    this.hospitalName,
    this.doctorName,
    this.description,
    this.medicine,
    this.otherPrescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Record ID:  ",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff585950),
                    ),
                  ),
                  Text(
                    recordId,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Color(0xff585950),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Hospital Name:  ",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff585950),
                    ),
                  ),
                  Text(
                    hospitalName,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Color(0xff585950),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Doctor Name:  ",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff585950),
                    ),
                  ),
                  Text(
                    doctorName,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Color(0xff585950),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Diagnosis Description: ",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff585950),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      description,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Color(0xff585950),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prescriptions:  ",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff585950),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Medicine: ",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Color(0xff585950),
                        ),
                      ),
                      Text(
                        medicine,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Color(0xff585950),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Other: ",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Color(0xff585950),
                        ),
                      ),
                      Text(
                        otherPrescription,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Color(0xff585950),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
