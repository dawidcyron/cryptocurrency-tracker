import 'package:cryptocurrency/cryptocurrency/cryptocurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;


Card _cryptocurrencyListItem(Cryptocurrency cryptocurrency) {
  return Card(
    elevation: 9,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(64, 75, 96, 0.9),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 1,
                color: Colors.white24,
              )
            )
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage("https://www.cryptocompare.com" + cryptocurrency.imageUrl),
          ),
        ),
        title: Text(
          cryptocurrency.fromSymbol,
          style: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
          )
        ),
        subtitle: Text(
          cryptocurrency.changePtcDay.toString() + "%",
          style: TextStyle(
            color: cryptocurrency.changePtcDay < 0 ? Colors.red : Colors.green
          ),
        ),
        trailing: Column(
          children: <Widget>[
            Text(
              cryptocurrency.price.toString() + " \$",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )
            ),
            Text(
              timeago.format(DateTime.fromMillisecondsSinceEpoch(int.parse(cryptocurrency.lastUpdate)*1000)),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ),
    ),
  );
}

class CryptocurrencyListItemGenerator extends StatelessWidget {
  final List<Cryptocurrency> cryptocurrencies;

  CryptocurrencyListItemGenerator({Key key, this.cryptocurrencies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: cryptocurrencies.length,
        itemBuilder: (BuildContext context, int index) {
          return _cryptocurrencyListItem(cryptocurrencies[index]);
        },
      ),
    );
  }
}