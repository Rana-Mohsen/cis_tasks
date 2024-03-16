import 'package:dots_indicator/dots_indicator.dart';
import 'package:first_task/models/item_model.dart';
import 'package:first_task/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.itemData});
  final ItemModel itemData;
  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemData.name!),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: hight / 3,
              width: width / 1.5,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (_, i) {
                    return Image.asset(
                      "assets/images/${widget.itemData.images[i]}",
                      height: 50,
                      // width: 12,
                      fit: BoxFit.fill,
                    );
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            DotsIndicator(
              position: currentIndex,
              dotsCount: widget.itemData.images.length,
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: Colors.purple,
                spacing: const EdgeInsets.only(left: 8, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                size: const Size.square(6.0),
                activeSize: const Size(28.0, 6.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            CustomButton(title: "Add To Cart", color: Colors.yellow),
            CustomButton(title: "Buy Now", color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
