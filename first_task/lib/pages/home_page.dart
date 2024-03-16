import 'package:first_task/models/item_model.dart';
import 'package:first_task/pages/favorit_page.dart';
import 'package:first_task/widgets/custom_choice_chip.dart';
import 'package:first_task/widgets/custom_grid.dart';
import 'package:first_task/widgets/custome_textfield.dart';
import 'package:first_task/widgets/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isSelected = false;
  List<ItemModel> items = [
  ItemModel("pink", "pink.jpg", ["pink1.jpg", "pink2.jpg"], false),
  ItemModel("white", "white.jpg", ["white1.jpg", "white2.jpg"], false),
  ItemModel("yellow", "yellow.jpg", ["yellow1.jpg", "yellow2.jpg"], false),
  ItemModel("pink", "pink.jpg", ["pink1.jpg", "pink2.jpg"], false),
  ItemModel("white", "white.jpg", ["white1.jpg", "white2.jpg"], false),
  ItemModel("yellow", "yellow.jpg", ["yellow1.jpg", "yellow2.jpg"], false),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(left: 28),
          child: Text("Test"),
        )),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: GestureDetector(onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoritPage()));
            },child: Icon(Icons.favorite_border_outlined)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            CustomeTextField(
              onChange: (value) {},
              hintText: 'Search',
            ),
            CustomChoiceChip(),
            CustomGrid(len: items.length,item: items,)
          ],
        ),
      ),
    );
  }
}
