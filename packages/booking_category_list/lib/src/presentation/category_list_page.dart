import 'package:booking_category_list/src/application/category_list/category_list_bloc.dart';
import 'package:booking_category_list/src/domain/i_category_list_repository.dart';
import 'package:booking_category_list/src/injection.dart';
import 'package:booking_home/booking_home.dart';
import 'package:booking_product_list/booking_product_list.dart';
import 'package:flutter/material.dart';

import 'helpers/category_helper.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryListBloc(
        repository: di<ICategoryListRepository>(),
      )..add(const CategoryListEvent.onLoadCategories()),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: const Text(
            'Category List',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: BlocBuilder<CategoryListBloc, CategoryListState>(
          builder: (context, state) {
            final categories = state.categoryList;

            if (state.isLoading) {
              return const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return GridView.count(
              padding: const EdgeInsets.all(18),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 4 / 1,
              children: [
                ...categories.map(
                  (category) => CategoryItem(
                    name: CategoryHelper.formatTitle(category),
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
            );
          },
        ),
      ),
    );
  }
}
