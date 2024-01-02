import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_cart_app/bloc/cart_bloc.dart';
import 'package:my_flutter_cart_app/logger/logger.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catalog',
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.archive,
            ),
          ),
        ],
      ),
      body: ListView(
        children: _itemList
            .map((e) => _buildItem(
                  e,
                ))
            .toList(),
      ),
    );
  }

  Widget _buildItem(Item item) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          item.title,
        ),
        subtitle: Text(
          '${item.price}',
        ),
        trailing:
            BlocBuilder<CartBloc, List<Item>>(builder: (context, blocState) {
          bool checked = blocState.contains(item);
          return IconButton(
            onPressed: () {
              logger.info('qwerasdf tap button');
              logger.info('qwerasdf ${cartBloc.state}');
              if (checked) {
                cartBloc.add(CartEvent(CartEventType.remove, item));
              } else {
                logger.info('qwerasdf ${cartBloc.state} 2222');
                cartBloc.add(CartEvent(CartEventType.add, item));
                logger.info('qwerasdf ${cartBloc.state}');
              }
              logger.info('qwerasdf ${cartBloc.state}');
            },
            icon: checked
                ? const Icon(
                    Icons.check,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.check,
                    color: Colors.grey,
                  ),
          );
        }),
      ),
    );
  }
}
