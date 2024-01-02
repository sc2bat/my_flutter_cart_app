// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_flutter_cart_app/ui/page/catalog_page.dart';

class LoginScreenPage extends StatelessWidget {
  const LoginScreenPage({
    super.key,
  });

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
