import 'dart:convert';

import 'package:cryptocurrency/cryptocurrency/cryptocurrency.dart';
import 'package:cryptocurrency/cryptocurrency/widgets/cryptocurrency_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

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
          if (snapshot.hasError) Text(snapshot.error);
          return snapshot.hasData
          ? CryptocurrencyListItemGenerator(cryptocurrencies: snapshot.data,)
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

Future<List<Cryptocurrency>> fetchCryptocurrency() async {
  final response = await http.get("http://ec2-34-245-150-251.eu-west-1.compute.amazonaws.com/api");
  if(response.statusCode == 200) {
    return compute(parseCryptocurrencyFromResponseBody, response.body);
  } else {
    throw Exception("Failed to load cryptocurrencies");
  }
} 

List<Cryptocurrency> parseCryptocurrencyFromResponseBody(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Cryptocurrency>((json) => Cryptocurrency.fromJson(json)).toList();
}