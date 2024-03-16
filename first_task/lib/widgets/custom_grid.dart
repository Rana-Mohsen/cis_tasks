import 'package:first_task/models/item_model.dart';
import 'package:first_task/widgets/item_card.dart';
import 'package:flutter/material.dart';

class CustomGrid extends StatefulWidget {
  const CustomGrid({super.key, required this.len, required this.item});
  final int len;
  final List<ItemModel> item;
  @override
  State<CustomGrid> createState() => _CustoGridState();
}

class _CustoGridState extends State<CustomGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.05,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: widget.len,
        itemBuilder: (context, index) {
          return ItemCard(
            item: widget.item[index],
          );
        });
  }
}
