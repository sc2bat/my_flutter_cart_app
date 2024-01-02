import 'package:flutter/widgets.dart';
import 'package:my_flutter_cart_app/bloc/cart_bloc.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  const CartProvider({
    Key? key,
    required CartBloc cartBloc,
    required Widget child,
  })  : cartBloc = cartBloc,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

  static CartBloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<CartProvider>()
              as CartProvider)
          .cartBloc;
}
