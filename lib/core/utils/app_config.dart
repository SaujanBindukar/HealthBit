import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

import 'contract_parser.dart';

class AppConfig {
  final String relayWallet =
      "864996f54c34856f530db7f228293ff74239cfd6804fb2914f828d173d0f0b7a";
  final String apiUrl = "https://rpc-mumbai.matic.today";
  final String contractAddress = "0x0DEB2959faca28b410E7dA6e1522fd5dbebcDB94";

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
