library booking_home;

export 'src/presentation/home_page.dart';
export 'src/injection.dart' hide di;

// might want to divide it to its own package
export 'src/domain/entities/product.dart';
export 'src/infrastructure/models/product_mdl.dart';
export 'src/presentation/widgets/product_card.dart';
export 'src/presentation/widgets/category_item.dart';

export 'package:carousel_slider/carousel_slider.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:dartz/dartz.dart' hide State;
