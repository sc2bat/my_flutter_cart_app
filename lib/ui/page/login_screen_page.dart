import 'package:flutter/material.dart';
import 'package:my_flutter_cart_app/ui/page/catalog_page.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CatalogPage(),
              ),
            );
          },
          child: const Text(
            'Login Button',
          ),
        ),
      ),
    );
  }
}
