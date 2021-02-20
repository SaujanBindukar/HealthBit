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
import '../../features/Patient/Medical_History/medicalHistory.dart';
import '../../features/Patient/Patient_Profile/patientProfile.dart';
import '../../features/SignUp/signup.dart';

class Routes {
  static const String GetStarted = 'GetStarted';
  static const String category = '/Category';
  static const String login = '/Login';
  static const String signUp = '/sign-up';
  static const String patientProfile = '/patient-profile';
  static const String medicalHistory = '/medical-history';
  static const all = <String>{
    GetStarted,
    category,
    login,
    signUp,
    patientProfile,
    medicalHistory,
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
          userCredential: args.userCredential,
        ),
        settings: data,
      );
    },
    MedicalHistory: (data) {
      final args = data.getArgs<MedicalHistoryArguments>(
        orElse: () => MedicalHistoryArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MedicalHistory(key: args.key),
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
    UserCredential userCredential,
  }) =>
      push<dynamic>(
        Routes.patientProfile,
        arguments:
            PatientProfileArguments(key: key, userCredential: userCredential),
      );

  Future<dynamic> pushMedicalHistory({
    Key key,
  }) =>
      push<dynamic>(
        Routes.medicalHistory,
        arguments: MedicalHistoryArguments(key: key),
      );
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
  final UserCredential userCredential;
  PatientProfileArguments({this.key, this.userCredential});
}

/// MedicalHistory arguments holder class
class MedicalHistoryArguments {
  final Key key;
  MedicalHistoryArguments({this.key});
}
