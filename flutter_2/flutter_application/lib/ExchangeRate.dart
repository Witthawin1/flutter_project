import 'dart:convert';

ExchangeRate exchangeRateFromJson(String str) => ExchangeRate.fromJson(json.decode(str));

String exchangeRateToJson(ExchangeRate data) => json.encode(data.toJson());

class ExchangeRate {
    bool? success;
    int? timestamp;
    String? base;
    DateTime? date;
    Map<String, double>? rates;

    ExchangeRate({
        this.success,
        this.timestamp,
        this.base,
        this.date,
        this.rates,
    });

    factory ExchangeRate.fromJson(Map<String, dynamic> json) => ExchangeRate(
        success: json["success"],
        timestamp: json["timestamp"],
        base: json["base"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        rates: Map.from(json["rates"]!).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "timestamp": timestamp,
        "base": base,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "rates": Map.from(rates!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}