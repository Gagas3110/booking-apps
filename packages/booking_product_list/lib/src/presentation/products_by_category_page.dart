import 'package:booking_home/booking_home.dart';

import 'package:booking_product_list/src/application/product_list/product_list_bloc.dart';
import 'package:booking_product_list/src/infrastructure/extensions/string_ext.dart';
import 'package:booking_product_list/src/injection.dart';
import 'package:flutter/material.dart';

import 'views/product_grid_view.dart';

class ProductsByCategoryPage extends StatefulWidget {
  final String category;

  const ProductsByCategoryPage({
    super.key,
    required this.category,
  });

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  late ProductListBloc productListBloc;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    productListBloc = di<ProductListBloc>();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        productListBloc.add(const ProductListEvent.onLoadAllProducts());
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    productListBloc.add(const ProductListEvent.onResetState());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: productListBloc
        ..add(ProductListEvent.onLoadProductsByCategory(
          category: widget.category,
        )),
      child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.black,
              title: Text(
                widget.category.capitalize(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: SingleChildScrollView(
              controller: scrollController,
              child: ProductGridView(
                productList: state.productList,
                isLoading: state.isLoading,
              ),
            ),
          );
        },
      ),
    );
  }
}
