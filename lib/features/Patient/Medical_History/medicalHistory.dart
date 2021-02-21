import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbit/core/components/custom_medicalRecords.dart';
import 'package:healthbit/core/utils/app_config.dart';
import 'package:healthbit/core/utils/contract_parser.dart';
import 'package:healthbit/features/Patient/model/medical_record_response.dart';
import 'package:web3dart/contracts.dart';

class MedicalHistory extends StatefulWidget {
  String userId;
  MedicalHistory({this.userId});

  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  List<MedicalRecordResponse> medicalHistory = [];
  @override
  void initState() {
    readData();
    super.initState();
  }

  readData() async {
    final DeployedContract deployedContract =
        await ContractParser.fromAssets(AppConfig().contractAddress);

    final function = deployedContract.function("getMedicalRecord");
    List<dynamic> result = await AppConfig().ethClient().call(
      contract: deployedContract,
      function: function,
      params: [widget.userId],
    );
    for (var i = 0; i < result.first.length; i++) {
      MedicalRecordResponse response =
          MedicalRecordResponse.fromMap(result.first[i]);
      setState(() {
        medicalHistory.add(response);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5BA2F4),
      body: SafeArea(
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

              ListView.builder(
                shrinkWrap: true,
                itemCount: medicalHistory.length,
                itemBuilder: (context, index) {
                  MedicalRecordResponse record = medicalHistory[index];
                  return CustomMedicalRecords(
                    recordId: record.id,
                    doctorName: record.doctorName,
                    hospitalName: record.hospitalName,
                    description: record.diagnosis,
                    otherPrescription: record.prescription,
                    medicine: record.prescription,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
