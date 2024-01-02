import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_cart_app/bloc/cart.dart';
import 'package:my_flutter_cart_app/bloc/cart_bloc.dart';
import 'package:my_flutter_cart_app/model/item.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
  });

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catalog',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const Cart(),
                ),
              );
            },
            icon: const Icon(
              Icons.archive,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, List<Item>>(
        bloc: cartBloc,
        builder: (BuildContext context, List state) => Center(
          child: ListView(
            children: _itemList
                .map((item) => _buildItem(item, cartBloc, state))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Item item, CartBloc cartBloc, List state) {
    final isChecked = state.contains(item);

    return ListTile(
      title: Text(
        item.title,
      ),
      subtitle: Text('${item.price}'),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            if (isChecked) {
              cartBloc.add(CartEvent(CartEventType.remove, item));
            } else {
              cartBloc.add(CartEvent(CartEventType.add, item));
            }
          });
        },
        icon: Icon(Icons.check, color: isChecked ? Colors.red : Colors.grey),
      ),
    );
  }
}
