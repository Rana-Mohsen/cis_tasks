import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  currentImage(value) {
    currentIndex = value;
    // emit(ItemCurrent());
  }

  nextImage() {
    if (currentIndex < 2) {
      currentIndex += 1;
      pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      emit(ItemNext());
    }
  }

  previousImage() {
    if (currentIndex > 0) {
      currentIndex -= 1;
      pageController.previousPage(
          duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      emit(ItemBack());
    }
  }
}
