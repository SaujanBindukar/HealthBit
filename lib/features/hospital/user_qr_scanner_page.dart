import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/core/routes/router.gr.dart';
import 'package:healthbit/core/utils/app_config.dart';
import 'package:healthbit/core/utils/color.dart';
import 'package:healthbit/core/utils/contract_parser.dart';
import 'package:healthbit/features/Patient/model/medical_record_response.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:web3dart/web3dart.dart';

class UserQRScannerPage extends StatefulWidget {
  bool shouldPop;
  UserQRScannerPage({this.shouldPop = false});

  @override
  _UserQRScannerPageState createState() => _UserQRScannerPageState();
}

class _UserQRScannerPageState extends State<UserQRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;

  // void scanQR({String qrText}) async {
  //   scanQRBloc.add(ScanQR(qrCode: qrText, context: context));
  // }

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                //
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.white,
                    borderRadius: 10,
                    borderLength: 100,
                    borderWidth: 10,
                    cutOutSize: 200,
                  ),
                ),

                //
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 30,
                            top: MediaQuery.of(context).padding.top + 30,
                          ),
                          color: Colors.grey,
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "QR SCANNER FOR CHECK-IN",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 32,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.3,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Place QR code within the rectangle above.",
                    ),
                  ),
                ),

                //
              ],
            ),
          ),
          // BlocBuilder<ScanQrBloc, ScanQrState>(
          //   bloc: this.scanQRBloc,
          //   builder: (BuildContext context, ScanQrState state) {
          //     if (state is LoadingScanQrState) {
          //       return Container(
          //         color: Colors.white.withOpacity(0.5),
          //         alignment: Alignment.center,
          //         child: CircularProgressIndicator(),
          //       );
          //     } else if (state is NoDataScanQrState ||
          //         state is ErrorScanQrState) {
          //       controller.resumeCamera();
          //       return Container();
          //     } else {
          //       return Container();
          //     }
          //   },
          // ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      widget.shouldPop
          ? Navigator.pop(context, scanData.code)
          : ExtendedNavigator.root.push(Routes.medicalHistory,
              arguments: MedicalHistoryArguments(userId: scanData.code));

      controller.pauseCamera();
    });
  }

  // Future<List<MedicalRecordResponse>> getMedicalRecord(String qrData) async {
  //   final DeployedContract deployedContract =
  //       await ContractParser.fromAssets(AppConfig().contractAddress);
  //   List<MedicalRecordResponse> medicalHistory = [];

  //   final function = deployedContract.function("getMedicalRecord");
  //   List<dynamic> result = await AppConfig().ethClient().call(
  //     contract: deployedContract,
  //     function: function,
  //     params: [qrData],
  //   );
  //   for (var i = 0; i < result.first.length; i++) {
  //     MedicalRecordResponse response =
  //         MedicalRecordResponse.fromMap(result.first[i]);
  //     setState(() {
  //       medicalHistory.add(response);
  //     });
  //   }
  //   return medicalHistory;
  // }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
