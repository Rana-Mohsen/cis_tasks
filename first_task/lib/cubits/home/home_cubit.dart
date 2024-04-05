import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<ItemModel> foundItems = [];

  searchItem(result) {
    if (foundItems == result) {
      emit(SearchedItem());
    }
  }
}
