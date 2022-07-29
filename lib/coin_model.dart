import 'dart:convert';

class Coin {
  String name;
  String symbol;
  int cmc_rank;
  Map<String, dynamic> quote;
  Coin({
    required this.name,
    required this.symbol,
    required this.cmc_rank,
    required this.quote,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'symbol': symbol,
      'cmc_rank': cmc_rank,
      'quote': quote,
    };
  }

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      name: map['name'] ?? '',
      symbol: map['symbol'] ?? '',
      cmc_rank: map['cmc_rank']?.toInt() ?? 0,
      quote: Map<String, dynamic>.from(map['quote']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Coin.fromJson(String source) => Coin.fromMap(json.decode(source));
}
