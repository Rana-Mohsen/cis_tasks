import 'package:first_task/cubits/favorit/favorit_cubit.dart';
import 'package:first_task/models/item_model.dart';
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
    List<ItemModel> favoritItem =
        BlocProvider.of<FavoritCubit>(context).favoritItems;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Favorits(${items.length})"),
          ),
        ),
        body: BlocBuilder<FavoritCubit, FavoritState>(
          builder: (context, state) {
            print(state.toString());
            if (state is ShowFavorit) {
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Card(
                      surfaceTintColor: Colors.grey.withOpacity(1),
                      elevation: 1, // Add shadow
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                      ),
                      child: ListTile(
                        //tileColor: Colors.grey,
                        leading: Image.asset(
                          "assets/images/${items[index].mainImage}",
                        ),
                        title: Text("${items[index].name}"),
                        trailing: IconButton(
                          onPressed: () {
                            items[index].isFavorit = !items[index].isFavorit;
                            if (items[index].isFavorit) {
                              favoritItem.add(items[index]);
                            } else {
                              favoritItem.remove(items[index]);
                            }
                            BlocProvider.of<FavoritCubit>(context).favorit();

                            //setState(() {});
                          },
                          icon: items[index].isFavorit
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border_outlined),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is NoFavorit || state is FavoritInitial) {
              return const Center(
                child: Text("No Favorit Items"),
              );
            }
            return const Text("No state");
          },
        ));
  }
}
