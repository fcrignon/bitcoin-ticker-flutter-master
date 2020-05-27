import 'network.dart';

const String apiURL= 'https://rest.coinapi.io/v1/exchangerate';
const String apiKey = '818F3241-002C-48C9-941B-CC7786CDA1FC';

class CoinAPI{
  Future<dynamic> getCurrencie(String bitcoinSymbol, String currencieSymbol) async {
    Network network = Network('$apiURL/$bitcoinSymbol/$currencieSymbol?apikey=$apiKey');
    var data = await network.getData();
    return data;
  }
}