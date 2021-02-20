import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

class ContractParser {
  static Future<DeployedContract> fromAssets(String contractAddress) async {
    final contractJson =
        jsonDecode(await rootBundle.loadString('assets/MedicalHistory.json'));

    return DeployedContract(
        ContractAbi.fromJson(
            jsonEncode(contractJson["abi"]), contractJson["contractName"]),
        EthereumAddress.fromHex(contractAddress));
  }
}
