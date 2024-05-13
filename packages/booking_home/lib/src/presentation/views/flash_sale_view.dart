import 'package:booking_home/src/application/flash_sale/flash_sale_bloc.dart';
import 'package:booking_home/src/domain/i_home_repository.dart';
import 'package:booking_home/src/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_card.dart';

class FlashSaleView extends StatelessWidget {
  const FlashSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlashSaleBloc(
        repository: di<IHomeRepository>(),
      )..add(const FlashSaleEvent.onBuild()),
      child: BlocBuilder<FlashSaleBloc, FlashSaleState>(
        builder: (context, state) {
          final flashSaleProductList = state.flashSaleProductList;

          if (state.isLoading) {
            return const Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Flash Sale',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (flashSaleProductList.length > 4) ...[
                      GestureDetector(
                        onTap: () {
                          //TODO
                        },
                        child: const Row(
                          children: [
                            Text('See All'),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 18),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.5,
                  children: [
                    ...flashSaleProductList.take(4).map(
                          (product) => ProductCard(product: product),
                        ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
