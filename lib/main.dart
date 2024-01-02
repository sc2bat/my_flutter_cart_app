import 'package:flutter/material.dart';
import 'package:my_flutter_cart_app/bloc/cart_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_flutter_cart_app/bloc/cart_bloc.dart';
import 'package:my_flutter_cart_app/ui/page/login_screen_page.dart';

void main() {
  runApp(const MyApp());
}

final cartBloc = CartBloc();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreenPage(),
    );
    // return BlocProvider(
    //   create: (_) => CartBloc(),
    //   child: BlocBuilder<CartBloc, List>(
    //     // bloc: cartBloc,
    //     builder: (context, List state) => MaterialApp(
    //       title: 'Flutter Demo',
    //       theme: ThemeData(
    //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //         useMaterial3: true,
    //       ),
    //       home: const LoginScreenPage(),
    //     ),
    //   ),
    // );
  }
}
