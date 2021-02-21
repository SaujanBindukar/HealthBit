import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/core/utils/color.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ViewQR extends StatefulWidget {
  User user;
  ViewQR({this.user});
  @override
  _ViewQRState createState() => _ViewQRState();
}

class _ViewQRState extends State<ViewQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.primaryColor,
      appBar: AppBar(
        backgroundColor: UIColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("QR"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: QrImage(
                data: widget.user.uid,
                version: QrVersions.auto,
                size: 250,
                gapless: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
