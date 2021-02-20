import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

import 'contract_parser.dart';

class AppConfig {
  final String relayWallet =
      "7adc7e011deca10b72069a3f9821abb7523d83966bf277a9f75383e15004fd31";
  final String apiUrl = "http://192.168.137.1:7545";
  final String contractAddress = "0x81B36c4Dd54e31bAA0Ad15Bc33E571d9d22aE6f4";

  static Future<Credentials> get txnCredential async {
    return await AppConfig()
        .ethClient()
        .credentialsFromPrivateKey(AppConfig().relayWallet);
  }

  Web3Client ethClient() {
    final Client httpClient = Client();

    return Web3Client(apiUrl, httpClient);
  }

  static Future<DeployedContract> get contract async {
    final DeployedContract contract =
        await ContractParser.fromAssets(AppConfig().contractAddress);
    return contract;
  }

  static Future<bool> runTransaction(
      {String functionName, List parameter}) async {
    final DeployedContract deployedContract =
        await ContractParser.fromAssets(AppConfig().contractAddress);
    final Credentials credentials = await AppConfig()
        .ethClient()
        .credentialsFromPrivateKey(AppConfig().relayWallet);

    final function = deployedContract.function(functionName);
    try {
      await AppConfig()
          .ethClient()
          .sendTransaction(
              credentials,
              Transaction.callContract(
                  maxGas: 1000000,
                  contract: deployedContract,
                  function: function,
                  parameters: parameter),
              fetchChainIdFromNetworkId: true)
          .then(
            (value) => print(value),
          )
          .catchError(
        (onError) {
          throw onError;
        },
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
