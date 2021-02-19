import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

class ScreenUtilSetup extends StatelessWidget {
  final Widget child;
  const ScreenUtilSetup({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: Builder(
        builder: (BuildContext context) {
          return ScreenUtilInit(
            designSize: Size(
              375,
              812,
            ),
            builder: () {
              return child;
            },
          );
        },
      ),
    );
  }
}
