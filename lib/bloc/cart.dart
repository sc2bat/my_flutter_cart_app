import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_cart_app/bloc/cart_bloc.dart';
import 'package:my_flutter_cart_app/logger/logger.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
        ),
      ),
      body: BlocBuilder(
        bloc: cartBloc,
        builder: (BuildContext context, List stateList) {
          var sum = 0;
          if (stateList.isNotEmpty) {
            sum = stateList
                .map((e) => e.price)
                .reduce((value, element) => value + element);
          }
          logger.info('qewrasdf stateList => ${stateList.length}');
          return Center(
            child: Text(
              'sum : $sum',
            ),
          );
        },
      ),
    );
  }
}
