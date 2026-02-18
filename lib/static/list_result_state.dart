import 'package:slurp_restaurant_app/data/model/restaurant_list.dart';

sealed class ListResultState {}

class ListNoneState extends ListResultState {}

class ListLoadingState extends ListResultState {}

class ListErrorState extends ListResultState {
  final String error;

  ListErrorState(this.error);
}

class ListLoadedState extends ListResultState {
  final List<Restaurant> restaurants;

  ListLoadedState(this.restaurants);
}
