import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isFavorit = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Container(
                height: 165,
                width: 175,
                child: Image.asset(
                  "assets/images/yellow.jpg",
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
                Text("flower"),
                const SizedBox(
                  width: 100,
                ),
                GestureDetector(
                    onTap: () {
                      isFavorit = !isFavorit;
                      setState(() {});
                    },
                    child: isFavorit
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border_outlined))
              ],
            )
          ],
        ));
  }
}
