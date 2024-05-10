import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/category/category_bloc.dart';
import '../widgets/category_item.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc()..add(const CategoryEvent.onBuild()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          final categoryList = state.categoryList;

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
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (categoryList.length > 4) ...[
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
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 1,
                  children: [
                    ...categoryList.take(4).map(
                          (category) => CategoryItem(name: category),
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
