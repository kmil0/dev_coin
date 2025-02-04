class Stockdata {
  final String ticker;
  final String name;
  final double price;
  final double dayChange;

  Stockdata({
    required this.ticker,
    required this.name,
    required this.price,
    required this.dayChange,
  });

  factory Stockdata.fromJson(Map<String, dynamic> json) {
    return Stockdata(
        ticker: json['ticker'],
        name: json['name'],
        price: json['price'],
        dayChange: json['day_change']);
  }
  Stockdata copyWith(
          {String? ticker, String? name, double? price, double? dayChange}) =>
      Stockdata(
          ticker: ticker ?? this.ticker,
          name: name ?? this.name,
          price: price ?? this.price,
          dayChange: dayChange ?? this.dayChange);
}
