import 'package:booking_home/booking_home.dart' hide id;
import 'package:booking_product_list/src/domain/entities/product_list.dart';
import 'package:booking_product_list/src/infrastructure/models/product_list_response.dart';

extension ProductMdlExt on ProductMdl {
  Product toDomain() {
    return Product(
      id: id,
      title: title,
      brand: brand,
      price: price,
      imageUrl: thumbnail,
      discount: discountPercentage,
    );
  }
}

extension ProductListResponseExt on ProductListResponse {
  ProductList toDomain() {
    return ProductList(
      productList: List<Product>.from(
        products.map((x) => x.toDomain()),
      ),
      total: total ?? 0,
      skip: skip ?? 0,
      limit: limit ?? 0,
    );
  }
}
