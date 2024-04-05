import 'package:first_task/cubits/home/home_cubit.dart';
import 'package:first_task/models/item_model.dart';
import 'package:first_task/pages/favorit_page.dart';
import 'package:first_task/widgets/custom_choice_chip.dart';
import 'package:first_task/widgets/custom_grid.dart';
import 'package:first_task/widgets/custome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelected = false;
  List<ItemModel>? bodyItems;
  // initState() {
  //   // at the beginning, all users are shown
  //   _foundItems = items;
  //   super.initState();
  // }

  // This function is called whenever the text field changes
  List<ItemModel> _runFilter(String enteredKeyword) {
    List<ItemModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = items;
    } else {
      results = items
          .where((item) =>
              item.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(left: 28),
          child: Text("Test"),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritPage()));
                },
                child: const Icon(Icons.favorite_border_outlined)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            CustomeTextField(
              onChange: (value) {
                List<ItemModel> result = _runFilter(value);
                BlocProvider.of<HomeCubit>(context).foundItems = result;
                BlocProvider.of<HomeCubit>(context).searchItem(result);
              },
              hintText: 'Search',
            ),
            const CustomChoiceChip(),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is SearchedItem) {
                  bodyItems = BlocProvider.of<HomeCubit>(context).foundItems;
                } else {
                  bodyItems = items;
                }
                return Expanded(
                    child: CustomGrid(
                  len: bodyItems!.length,
                  item: bodyItems!,
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
