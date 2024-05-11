import 'package:booking_home/src/domain/entities/product.dart';
import 'package:booking_home/src/infrastructure/models/product_mdl.dart';

extension ProductMdlExt on ProductMdl {
  Product toDomain() {
    return Product(
      id: id,
      title: title,
      brand: brand,
      price: price,
      discount: discountPercentage,
    );
  }
}
