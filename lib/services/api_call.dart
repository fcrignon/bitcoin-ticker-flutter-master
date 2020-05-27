import 'network.dart';

const String apiURL= 'https://rest.coinapi.io/v1/exchangerate';
const String apiKey = '';

class CoinAPI{
  Future<dynamic> getCurrencie(String bitcoinSymbol, String currencieSymbol) async {
    Network network = Network('$apiURL/$bitcoinSymbol/$currencieSymbol?apikey=$apiKey');
    var data = await network.getData();
    return data;
  }
}
