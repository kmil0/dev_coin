import 'package:dev_coin/pages/main_page.dart';
import 'package:dev_coin/pages/stock_details_page.dart';
import 'package:dev_coin/providers/dev_coin_providers.dart';
import 'package:dev_coin/widgets/stock_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: DomCoinApp()));
}

class DomCoinApp extends StatelessWidget {
  const DomCoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainStockListPage(),
        '/stock': (context) => const StockDetailsPage()
      },
    );
  }
}

class StockListWidget extends ConsumerWidget {
  const StockListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockList = ref.watch(stockDataListProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(stockList.length, (index) {
        final stock = stockList[index];
        return StockItem(
          stockData: stock,
          onTapStock: (p0) {
            ref
                .read(selectedStockDataProvider.notifier)
                .updateSelectedStock(stock);
            Navigator.pushNamed(context, '/stock');
          },
        );
      }),
    );
  }
}

class AnotherWidget extends StatelessWidget {
  const AnotherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final name = ref.read(getNameProvider);

        return Text(name);
      },
    );
  }
}
