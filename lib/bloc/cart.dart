import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_cart_app/bloc/cart_bloc.dart';
import 'package:my_flutter_cart_app/bloc/cart_provider.dart';
import 'package:my_flutter_cart_app/logger/logger.dart';
import 'package:my_flutter_cart_app/main.dart';
import 'package:my_flutter_cart_app/model/item.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // final cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
        ),
      ),
      body: StreamBuilder(
        stream: CartProvider.of(context).cartList,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data is List<Item>) {
            List<Item>? list = snapshot.data as List<Item>;
            var sum = 0;
            if (list.isNotEmpty) {
              sum = list
                  .map((e) => e.price)
                  .reduce((value, element) => value + element);
            }
            logger.info('qewrasdf stateList => ${list.length}');
            return Center(
              child: Text(
                'sum : $sum',
              ),
            );
          } else {
            // 만약 데이터가 없거나 타입이 맞지 않을 경우에 대한 처리
            return const Center(
              child: Text(
                'No data',
              ),
            );
          }
        },
      ),

      // BlocBuilder(
      //   bloc: cartBloc,
      //   builder: (BuildContext context, List stateList) {
      //     var sum = 0;
      //     if (stateList.isNotEmpty) {
      //       sum = stateList
      //           .map((e) => e.price)
      //           .reduce((value, element) => value + element);
      //     }
      //     logger.info('qewrasdf stateList => ${stateList.length}');
      //     return Center(
      //       child: Text(
      //         'sum : $sum',
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
