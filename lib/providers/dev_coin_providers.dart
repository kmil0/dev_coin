import 'dart:async';
import 'dart:convert';

import 'package:dev_coin/models/stockdata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'dev_coin_providers.g.dart';

@riverpod
Future<bool> getStockData(Ref ref) async {
  try {
    List<Stockdata> data = [];

    final response = await http.get(Uri.parse(
        'https://api.stockdata.org/v1/data/quote?symbols=AAPL%2CTSLA%2CMFST%2CV&api_token=YMabqnjSylLtvYY2r3XC6NtsslkFfSagACDzwkV9'));

    if (response.statusCode == 200) {
      final jsonBody = response.body;
      final mappedData = json.decode(jsonBody);
      final stockData = mappedData['data'] as List<dynamic>;
      data = stockData.map((stock) => Stockdata.fromJson(stock)).toList();
    }

    ref.read(stockDataListProvider.notifier).updateStockList(data);
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(priceChangeProvider.notifier).updatePriceChange();
    });

    return true;
    // return Future.error('Error en la data');
  } on Exception catch (e) {
    rethrow;
  }
}

@riverpod
class PriceChange extends _$PriceChange {
  @override
  double build() => 0.01;

  void updatePriceChange() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state + 0.01;
    });
  }
}

@Riverpod(keepAlive: true)
class StockDataList extends _$StockDataList {
  @override
  List<Stockdata> build() => [];

  void updateStockList(List<Stockdata> newList) {
    state = [...state, ...newList];
  }

  void updateSingleStock(Stockdata stock) {
    state = [
      for (var s in state)
        if (s.name == stock.name)
          s.copyWith(name: stock.name, price: stock.price, ticker: stock.ticker)
        else
          s
    ];
  }
}

@Riverpod(keepAlive: true)
class SelectedStockData extends _$SelectedStockData {
  @override
  Stockdata? build() => null;

  void updateSelectedStock(Stockdata data) {
    state = state == null
        ? data
        : state!.copyWith(
            name: data.name,
            price: data.price,
            ticker: data.ticker,
            dayChange: data.dayChange);
  }
}

@riverpod
String getName(Ref ref) {
  return 'Hola John Doe';
}

@riverpod
class CarData extends _$CarData {
  @override
  Car build() => Car(doors: 4, wheels: 4);

  void updateDoors(double newDoors) {
    state = state.copyWith(doors: newDoors);
  }

  void updateWheels(double newWheels) {
    state = state.copyWith(wheels: newWheels);
  }
}

@riverpod
class PersonName extends _$PersonName {
  @override
  List<String> build() => [];

  void updatePersonaName(String newName) {
    state = [...state, newName];
  }
}

class Car {
  final double? wheels;
  final double? doors;

  Car({required this.wheels, required this.doors});

  Car copyWith({double? wheels, double? doors}) =>
      Car(wheels: wheels ?? this.doors, doors: doors);
}
