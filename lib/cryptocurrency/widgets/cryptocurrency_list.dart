import 'package:cryptocurrency/cryptocurrency/cryptocurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CryptocurrencyList extends State < ShowCryptocurrencyList > {
  List cryptocurrencies = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Cryptocurrency Tracker"),
      ),
      body: FutureBuilder<List<Cryptocurrency>>(
        future: fetchCryptocurrency(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
          ? Text("Has data")
          : Text("No data present");
        },
      )
    );
  }
}

class ShowCryptocurrencyList extends StatefulWidget {
  @override
  State createState() => CryptocurrencyList();
}