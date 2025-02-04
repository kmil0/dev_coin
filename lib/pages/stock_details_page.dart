import 'package:dev_coin/providers/dev_coin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class StockDetailsPage extends ConsumerWidget {
  const StockDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(selectedStockDataProvider)!;
    final stockColor =
        data.dayChange.isNegative ? Color(0xFFFF4242) : Color(0xFF26FF00);

    return Scaffold(
      backgroundColor: Color(0xFF272727),
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.ticker,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              data.name,
              style: TextStyle(
                  color: stockColor, fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(NumberFormat('\$#,#00.00', 'en_US').format(data.price),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
          ],
        )),
      ),
    );
  }
}
