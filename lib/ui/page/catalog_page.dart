import 'package:flutter/material.dart';
import 'package:my_flutter_cart_app/model/item.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

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
        children: _itemList.map((e) => _buildItem(e)).toList(),
      ),
    );
  }

  Widget _buildItem(Item item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          item.title,
        ),
        subtitle: Text(
          '${item.price}',
        ),
        trailing: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.check,
          ),
        ),
      ),
    );
  }
}
