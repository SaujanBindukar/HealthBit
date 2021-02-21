// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../features/Category/category.dart';
import '../../features/GetStarted/getStarted.dart';
import '../../features/Login/login.dart';
import '../../features/Patient/Add_Record/new_record.dart';
import '../../features/Patient/Medical_History/medicalHistory.dart';
import '../../features/Patient/Patient_Profile/patientProfile.dart';
import '../../features/Patient/qr_page/view_qr.dart';
import '../../features/SignUp/signup.dart';
import '../../features/hospital/hospital_screen.dart';
import '../../features/hospital/user_qr_scanner_page.dart';

class Routes {
  static const String GetStarted = 'GetStarted';
  static const String category = '/Category';
  static const String login = '/Login';
  static const String signUp = '/sign-up';
  static const String patientProfile = '/patient-profile';
  static const String medicalHistory = '/medical-history';
  static const String newRecord = '/new-record';
  static const String viewQR = '/view-qR';
  static const String hospitalScreen = '/hospital-screen';
  static const String userQRScannerPage = '/user-qr-scanner-page';
  static const all = <String>{
    GetStarted,
    category,
    login,
    signUp,
    patientProfile,
    medicalHistory,
    newRecord,
    viewQR,
    hospitalScreen,
    userQRScannerPage,
  };
}

class HealthBitRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.GetStarted, page: GetStarted),
    RouteDef(Routes.category, page: Category),
    RouteDef(Routes.login, page: Login),
    RouteDef(Routes.signUp, page: SignUp),
    RouteDef(Routes.patientProfile, page: PatientProfile),
    RouteDef(Routes.medicalHistory, page: MedicalHistory),
    RouteDef(Routes.newRecord, page: NewRecord),
    RouteDef(Routes.viewQR, page: ViewQR),
    RouteDef(Routes.hospitalScreen, page: HospitalScreen),
    RouteDef(Routes.userQRScannerPage, page: UserQRScannerPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    GetStarted: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const GetStarted(),
        settings: data,
      );
    },
    Category: (data) {
      final args = data.getArgs<CategoryArguments>(
        orElse: () => CategoryArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Category(key: args.key),
        settings: data,
      );
    },
    Login: (data) {
      final args = data.getArgs<LoginArguments>(
        orElse: () => LoginArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => Login(
          key: args.key,
          patient: args.patient,
        ),
        settings: data,
      );
    },
    SignUp: (data) {
      final args = data.getArgs<SignUpArguments>(
        orElse: () => SignUpArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUp(
          key: args.key,
          patient: args.patient,
        ),
        settings: data,
      );
    },
    PatientProfile: (data) {
      final args = data.getArgs<PatientProfileArguments>(
        orElse: () => PatientProfileArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => PatientProfile(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    MedicalHistory: (data) {
      final args = data.getArgs<MedicalHistoryArguments>(
        orElse: () => MedicalHistoryArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MedicalHistory(userId: args.userId),
        settings: data,
      );
    },
    NewRecord: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NewRecord(),
        settings: data,
      );
    },
    ViewQR: (data) {
      final args = data.getArgs<ViewQRArguments>(
        orElse: () => ViewQRArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ViewQR(user: args.user),
        settings: data,
      );
    },
    HospitalScreen: (data) {
      final args = data.getArgs<HospitalScreenArguments>(
        orElse: () => HospitalScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HospitalScreen(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    UserQRScannerPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserQRScannerPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension HealthBitRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushGetStarted() => push<dynamic>(Routes.GetStarted);

  Future<dynamic> pushCategory({
    Key key,
  }) =>
      push<dynamic>(
        Routes.category,
        arguments: CategoryArguments(key: key),
      );

  Future<dynamic> pushLogin({
    Key key,
    bool patient,
  }) =>
      push<dynamic>(
        Routes.login,
        arguments: LoginArguments(key: key, patient: patient),
      );

  Future<dynamic> pushSignUp({
    Key key,
    bool patient,
  }) =>
      push<dynamic>(
        Routes.signUp,
        arguments: SignUpArguments(key: key, patient: patient),
      );

  Future<dynamic> pushPatientProfile({
    Key key,
    User user,
  }) =>
      push<dynamic>(
        Routes.patientProfile,
        arguments: PatientProfileArguments(key: key, user: user),
      );

  Future<dynamic> pushMedicalHistory({
    String userId,
  }) =>
      push<dynamic>(
        Routes.medicalHistory,
        arguments: MedicalHistoryArguments(userId: userId),
      );

  Future<dynamic> pushNewRecord() => push<dynamic>(Routes.newRecord);

  Future<dynamic> pushViewQR({
    User user,
  }) =>
      push<dynamic>(
        Routes.viewQR,
        arguments: ViewQRArguments(user: user),
      );

  Future<dynamic> pushHospitalScreen({
    Key key,
    User user,
  }) =>
      push<dynamic>(
        Routes.hospitalScreen,
        arguments: HospitalScreenArguments(key: key, user: user),
      );

  Future<dynamic> pushUserQRScannerPage() =>
      push<dynamic>(Routes.userQRScannerPage);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// Category arguments holder class
class CategoryArguments {
  final Key key;
  CategoryArguments({this.key});
}

/// Login arguments holder class
class LoginArguments {
  final Key key;
  final bool patient;
  LoginArguments({this.key, this.patient});
}

/// SignUp arguments holder class
class SignUpArguments {
  final Key key;
  final bool patient;
  SignUpArguments({this.key, this.patient});
}

/// PatientProfile arguments holder class
class PatientProfileArguments {
  final Key key;
  final User user;
  PatientProfileArguments({this.key, this.user});
}

/// MedicalHistory arguments holder class
class MedicalHistoryArguments {
  final String userId;
  MedicalHistoryArguments({this.userId});
}

/// ViewQR arguments holder class
class ViewQRArguments {
  final User user;
  ViewQRArguments({this.user});
}

/// HospitalScreen arguments holder class
class HospitalScreenArguments {
  final Key key;
  final User user;
  HospitalScreenArguments({this.key, this.user});
}
