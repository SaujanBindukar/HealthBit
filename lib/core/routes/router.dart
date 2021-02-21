import 'package:auto_route/auto_route_annotations.dart';
import 'package:healthbit/features/Category/category.dart';
import 'package:healthbit/features/GetStarted/getStarted.dart';
import 'package:healthbit/features/Login/login.dart';
import 'package:healthbit/features/Patient/Add_Record/new_record.dart';

import 'package:healthbit/features/Patient/Medical_History/medicalHistory.dart';

import 'package:healthbit/features/Patient/Patient_Profile/patientProfile.dart';
import 'package:healthbit/features/Patient/qr_page/view_qr.dart';
import 'package:healthbit/features/SignUp/signup.dart';
import 'package:healthbit/features/hospital/hospital_screen.dart';
import 'package:healthbit/features/hospital/user_qr_scanner_page.dart';

@MaterialRouter(generateNavigationHelperExtension: true, routes: <AutoRoute>[
  MaterialRoute(
    initial: true,
    page: GetStarted,
    path: "GetStarted",
    name: "GetStarted",
  ),
  MaterialRoute(
    page: Category,
  ),
  MaterialRoute(
    page: Login,
  ),
  MaterialRoute(
    page: SignUp,
  ),
  MaterialRoute(
    page: PatientProfile,
  ),
  MaterialRoute(
    page: MedicalHistory,
  ),
  MaterialRoute(
    page: NewRecord,
  ),
  MaterialRoute(
    page: ViewQR,
  ),
  MaterialRoute(page: HospitalScreen),
  MaterialRoute(page: UserQRScannerPage),
])
class $HealthBitRouter {}
