import 'package:slurp_restaurant_app/data/model/restaurant_detail.dart';

sealed class DetailResultState {}

class DetailNoneState extends DetailResultState {}

class DetailLoadingState extends DetailResultState {}

class DetailErrorState extends DetailResultState {
  final String error;

  DetailErrorState(this.error);
}

class DetailLoadedState extends DetailResultState {
  final RestaurantDetail restaurant;

  DetailLoadedState(this.restaurant);
}
