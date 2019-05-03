class Cryptocurrency {
  String type;
  String fromSymbol;
  double price;
  String lastUpdate;
  String openDay;
  String highDay;
  String lowDay;
  double changePtcDay;
  String imageUrl;

  Cryptocurrency({
    this.type,
    this.fromSymbol,
    this.price,
    this.lastUpdate,
    this.openDay,
    this.highDay,
    this.lowDay,
    this.changePtcDay,
    this.imageUrl
  });

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) {
    return Cryptocurrency(
      type: json['TYPE'],
      fromSymbol: json['FROMSYMBOL'],
      price: (json['PRICE']*100).round()/100,
      lastUpdate: json['LASTUPDATE'],
      openDay: json['OPENDAY'],
      highDay: json['HIGHDAY'],
      lowDay: json['LOWDAY'],
      changePtcDay: (double.parse(json['CHANGEPCTDAY'])*100).round()/100,
      imageUrl: json['IMAGEURL']
    );
  }
  
}