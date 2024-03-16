import 'package:first_task/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.itemData});
  final ItemModel itemData;
  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemData.name!),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
