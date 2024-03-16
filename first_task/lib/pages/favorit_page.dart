import 'package:first_task/cubits/favorit/favorit_cubit.dart';
import 'package:first_task/models/item_model.dart';
import 'package:first_task/widgets/custom_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({super.key});

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  @override
  Widget build(BuildContext context) {
      List<ItemModel> items = BlocProvider.of<FavoritCubit>(context).favoritItems;

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<FavoritCubit, FavoritState>(
        builder: (context, state) {
          if (state == ShowFavorit()) {
            return CustomGrid(len: items.length,item: items,);
          } else {
            return Center(
              child: Text("No Favorit Items"),
            );
          }
          ;
        },
      ),
    );
  }
}
