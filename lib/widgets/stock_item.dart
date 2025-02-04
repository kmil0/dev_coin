import 'package:dev_coin/models/stockdata.dart';
import 'package:dev_coin/providers/dev_coin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockItem extends ConsumerWidget {
  final Function(Stockdata) onTapStock;
  final Stockdata stockData;
  const StockItem(
      {super.key, required this.stockData, required this.onTapStock});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockColor =
        stockData.dayChange.isNegative ? Color(0xFFFF4242) : Color(0xFF26FF00);
    final stockIcon = stockData.dayChange.isNegative
        ? Icons.arrow_downward
        : Icons.arrow_upward;
    return Container(
      margin: EdgeInsets.all(16),
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            onTapStock(stockData);
          },
          child: Container(
              padding: EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stockData.ticker,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        stockData.name,
                        style: TextStyle(
                            color: Color(0xFFFF4242),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Consumer(
                        builder: (context, ref, child) {
                          final price = ref.watch(priceChangeProvider);
                          return Text('${price.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold));
                          // return Text(
                          //     NumberFormat('\$#,#00.00', 'en_US')
                          //         .format(stockData.price),
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.bold));
                        },
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            stockIcon,
                            color: stockColor,
                          ),
                          Text(
                            ('${stockData.dayChange}'),
                            style: TextStyle(
                                color: stockColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ))
                ],
              )),
        ),
      ),
    );
  }
}
