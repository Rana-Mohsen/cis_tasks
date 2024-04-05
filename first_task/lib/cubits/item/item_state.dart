part of 'item_cubit.dart';

@immutable
abstract class ItemState {}

class ItemInitial extends ItemState {}
class ItemCurrent extends ItemState {}
class ItemNext extends ItemState {}
class ItemBack extends ItemState {}
