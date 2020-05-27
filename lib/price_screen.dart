import 'dart:io' show Platform;
// import 'package:crypto_font_icons/crypto_font_icon_data.dart';
// import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrencie = 'USD';
  String symCripo = 'BTN';
  Map<String, String> cryptoPrice = {};
  CoinData coinData = CoinData();

  DropdownButton<String> androidDropDown() {
    return DropdownButton<String>(
      value: selectedCurrencie,
      onChanged: (String value) {
        setState(() {
          selectedCurrencie = value;
          getCrytoData();
        });
      },
      selectedItemBuilder: (BuildContext context) {
        return currenciesList.map<Widget>((String currencie) {
          return Text(currencie);
        }).toList();
      },
      items: currenciesList.map((String currencie) {
        return DropdownMenuItem<String>(
          child: Text(currencie),
          value: currencie,
        );
      }).toList(),
    );
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker.builder(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIdex) {
          setState(() {
            selectedCurrencie = currenciesList[selectedIdex];
            getCrytoData();
          });
        },
        childCount: currenciesList.length,
        itemBuilder: (context, index) {
          final String currencie = currenciesList[index];
          return Text(currencie);
        });
  }

  void getCrytoData() async {
    var data = await coinData.getCryptoCoinData(selectedCurrencie);
    setState(() {
      cryptoPrice = data;
    });
  }

//  CryptoFontIconData getIcon(String symbol){
//     if (symbol == 'BTC'){
//       return CryptoFontIcons.BTC;
//     } else if(symbol == 'ETH'){
//       return CryptoFontIcons.ETH;
//     } else {
//       return CryptoFontIcons.LTC;
//     }

//   }

  @override
  void initState() {
    super.initState();
    getCrytoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cryptoList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Icon(getIcon(cryptoList[index])),
                          Text(
                            '1 ${cryptoList[index]} = ${cryptoPrice['${cryptoList[index]}']} $selectedCurrencie',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? androidDropDown() : iOSPicker(),
          ),
        ],
      ),
    );
  }
}
