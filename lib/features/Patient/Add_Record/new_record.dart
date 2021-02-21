import 'package:flutter/material.dart';
import 'package:healthbit/core/utils/app_config.dart';

class NewRecord extends StatefulWidget {
  @override
  _NewRecordState createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  TextEditingController recordIdController = TextEditingController();
  TextEditingController hospitalNameController = TextEditingController();
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController prescriptionController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5BA2F4),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0,
        backgroundColor: Color(0xff5BA2F4),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Record"),
            TextField(
              controller: recordIdController,
              decoration: InputDecoration(
                hintText: "Record Id",
              ),
            ),
            TextField(
              controller: hospitalNameController,
              decoration: InputDecoration(
                hintText: "Hospital Name",
              ),
            ),
            TextField(
              controller: doctorNameController,
              decoration: InputDecoration(
                hintText: "Doctor Name",
              ),
            ),
            TextField(
              controller: diagnosisController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Diagnosis Description",
              ),
            ),
            TextField(
              controller: prescriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Prescriptions",
              ),
            ),
            TextField(
              controller: remarkController,
              decoration: InputDecoration(hintText: "Remark"),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  bool success = await AppConfig.runTransaction(
                    functionName: "addMedicalRecord",
                    parameter: [
                      recordIdController.text,
                      [
                        recordIdController.text,
                        recordIdController.text,
                        hospitalNameController.text,
                        diagnosisController.text,
                        prescriptionController.text,
                        prescriptionController.text,
                        ["google.com"],
                      ],
                    ],
                  );
                  if (success) {
                    Navigator.pop(context);
                  } else {
                    recordIdController.clear();
                    hospitalNameController.clear();
                    diagnosisController.clear();
                    prescriptionController.clear();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.black54),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "Add Record",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
