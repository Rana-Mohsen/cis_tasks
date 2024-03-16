import 'package:bloc/bloc.dart';
import 'package:first_task/models/item_model.dart';
import 'package:meta/meta.dart';

part 'favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState> {
  FavoritCubit() : super(FavoritInitial());
  List<ItemModel> favoritItems = [];

  favorit() {
    if (favoritItems.isEmpty) {
      emit(NoFavorit());
    } else {
      emit(ShowFavorit());
    }
  }
}
