import 'services/api_call.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getCryptoCoinData(String selectedCurrency) async {
    CoinAPI coinAPI = CoinAPI();
    Map<String, String> cryptoCoinsPrice={};
    for (String cryptoSymbol in cryptoList){
      var data = await coinAPI.getCurrencie(cryptoSymbol, selectedCurrency);
      double lastPrice = data['rate'];
      cryptoCoinsPrice[cryptoSymbol] = lastPrice.toStringAsFixed(0);
    }
    return cryptoCoinsPrice;
  }
}
