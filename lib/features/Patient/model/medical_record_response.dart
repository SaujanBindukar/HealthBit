class MedicalRecordResponse {
  String id;
  String userId;
  String hospitalName;
  String doctorName;
  String diagnosis;
  String prescription;
  List<dynamic> files;

  MedicalRecordResponse(this.id, this.userId, this.hospitalName,
      this.doctorName, this.diagnosis, this.prescription, this.files);

  MedicalRecordResponse.fromMap(List data)
      : id = data[0],
        userId = data[1],
        hospitalName = data[2],
        doctorName = data[3],
        diagnosis = data[4],
        prescription = data[5],
        files = data[6];
}
