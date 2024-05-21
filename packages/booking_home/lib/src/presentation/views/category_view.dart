import 'package:booking_home/src/application/category/category_bloc.dart';
import 'package:booking_home/src/domain/i_home_repository.dart';
import 'package:booking_home/src/injection.dart';
import 'package:booking_product_list/booking_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/category_item.dart';
import 'category_view_shimmer.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc(
        repository: di<IHomeRepository>(),
      )..add(const CategoryEvent.onBuild()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          final categoryList = state.categoryList;

          if (state.isLoading) {
            return const Padding(
              padding: EdgeInsets.all(12.0),
              child: CategoryViewShimmer(),
              // Center(
              //   child: CircularProgressIndicator(),
              // ),
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
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (categoryList.length > 4) ...[
                      GestureDetector(
                        onTap: () {},
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
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 1,
                  children: [
                    ...categoryList.take(4).map(
                          (category) => CategoryItem(
                            name: category,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return ProductsByCategoryPage(
                                      category: category.toLowerCase(),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
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
