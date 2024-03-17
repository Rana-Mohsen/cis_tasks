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
  PageController _pageController = PageController(initialPage: 0);
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: hight / 4,
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
                        //height: 40,
                        // width: 12,
                        fit: BoxFit.fill,
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 30,
                        onPressed: () {
                          if (currentIndex > 0) {
                            currentIndex -= 1;
                            _pageController.previousPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                            setState(() {});
                          }
                        },
                        icon: Icon(Icons.arrow_back)),
                    DotsIndicator(
                      position: currentIndex,
                      dotsCount: widget.itemData.images.length,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.purple,
                        spacing: const EdgeInsets.only(left: 4, right: 4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        size: const Size.square(6.0),
                        activeSize: const Size(28.0, 6.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    IconButton(
                        iconSize: 30,
                        onPressed: () {
                          if (currentIndex < 2) {
                            currentIndex += 1;
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                            setState(() {});
                          }
                        },
                        icon: Icon(Icons.arrow_forward)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.itemData.name!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("5 satrs",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ],
              ),
              SizedBox(
                width: width / 1.3,
                child: Text(
                  "flowerflowerflowerflowerflowerflower",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              CustomButton(title: "Add To Cart", color: Colors.yellow),
              SizedBox(
                height: 10,
              ),
              CustomButton(title: "Buy Now", color: Colors.orange),
            ],
          ),
        ),
      ),
    );
  }
}
