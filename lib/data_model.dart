import 'dart:convert';

import 'package:coinrich_flutter/coin_model.dart';

class Data {
  String BTC;
  String ETH;
  String LTC;
  Data({
    required this.BTC,
    required this.ETH,
    required this.LTC,
  });

  Map<String, dynamic> toMap() {
    return {
      'BTC': BTC,
      'ETH': ETH,
      'LTC': LTC,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      BTC: map['BTC'] ?? '',
      ETH: map['ETH'] ?? '',
      LTC: map['LTC'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}
