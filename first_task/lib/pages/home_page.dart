import 'package:first_task/widgets/custom_button.dart';
import 'package:first_task/widgets/custome_textfield.dart';
import 'package:first_task/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(left: 28),
          child: Text("Test"),
        )),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(children: [
          CustomeTextField(
            onChange: (value) {},
            hintText: 'Search',
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomButton(title: "button1"),
            CustomButton(title: "button2"),
            CustomButton(title: "button3")
          ]),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.05,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ItemCard();
                }),
          )
        ]),
      ),
    );
  }
}
