import 'package:first_task/cubits/favorit/favorit_cubit.dart';
import 'package:first_task/models/item_model.dart';
import 'package:first_task/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key, required this.item});
  final ItemModel item;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    List<ItemModel> favoritItem =
        BlocProvider.of<FavoritCubit>(context).favoritItems;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemPage(
                      itemData: widget.item,
                    )));
      },
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0xfff7f2f9),
              borderRadius: BorderRadius.circular(16)),
          // height: 200,
          // width: 190,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 120,
                  width: 175,
                  child: Image.asset(
                    "assets/images/${widget.item.mainImage}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.item.name!),
                  const SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                      onTap: () {
                        widget.item.isFavorit = !widget.item.isFavorit;
                        if (widget.item.isFavorit) {
                          favoritItem.add(widget.item);
                          BlocProvider.of<FavoritCubit>(context).favorit();
                        } else {
                          favoritItem.remove(widget.item);
                          BlocProvider.of<FavoritCubit>(context).favorit();
                        }
                        setState(() {});
                      },
                      child: widget.item.isFavorit
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border_outlined))
                ],
              )
            ],
          )),
    );
  }
}
