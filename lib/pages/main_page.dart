import 'package:dev_coin/main.dart';
import 'package:dev_coin/providers/dev_coin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainStockListPage extends ConsumerWidget {
  const MainStockListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.read(getNameProvider);
    final personName = ref.watch(personNameProvider);
    final stockData = ref.watch(getStockDataProvider);

    return Scaffold(
        backgroundColor: Color(0xFF272727),
        body: stockData.when(
            data: (data) {
              return StockListWidget();
            },
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => Center(child: CircularProgressIndicator()))

        //  Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(personName.join(',')),
        //       ElevatedButton(
        //           onPressed: () {
        //             ref
        //                 .read(personNameProvider.notifier)
        //                 .updatePersonaName('John Doe');
        //           },
        //           child: Text('Cambiar nombre'))
        //     ],
        //   ),
        // ),

        );
  }
}
