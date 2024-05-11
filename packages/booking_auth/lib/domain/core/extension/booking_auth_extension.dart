import 'package:booking_auth/domain/core/extension/shared/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension Scaler on BuildContext {
  double scaleFont(double initialFontSize) {
    return (MediaQuery.of(this).size.width * 0.0027) * initialFontSize;
  }

  double scaleHeight(double initialHeight) {
    return (MediaQuery.of(this).size.height * 0.0011) * initialHeight;
  }

  double deviceWidth(double width) {
    return (MediaQuery.of(this).size.width) * width;
  }

  double deviceHeight(double height) {
    return (MediaQuery.of(this).size.height) * height;
  }
}

extension SnackBars on BuildContext {
  failSnackbar(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(failSnackBar(message));
  }

  succesSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(successSnackBar(message));
  }
}

extension CircularProgressWidget on BuildContext {
  circularprogress() {
    return const CircularProgressIndicator(
      color: Colors.green,
    );
  }
}

///extension bloc provider
extension BlocProviderExtension on BuildContext {
  T bloc<T extends Bloc<dynamic, dynamic>>() {
    return BlocProvider.of<T>(this);
  }

  Widget buildBlocProvider<T extends Bloc<dynamic, dynamic>>({
    required Widget child,
    required T bloc,
  }) {
    return BlocProvider<T>.value(
      value: bloc,
      child: child,
    );
  }
}
