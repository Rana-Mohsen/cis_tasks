part of 'favorit_cubit.dart';

@immutable
abstract class FavoritState {}

class FavoritInitial extends FavoritState {}
class NoFavorit extends FavoritState {}
class ShowFavorit extends FavoritState {}

class FavoritPressed extends FavoritState {}
