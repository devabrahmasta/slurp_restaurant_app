import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/data/api/api_services.dart';
import 'package:slurp_restaurant_app/static/list_result_state.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantSearchProvider(this._apiServices);

  ListResultState _resultState = ListNoneState();
  ListResultState get resultState => _resultState;

  Future<void> searchRestaurant(String query) async {
    if (query.trim().isEmpty) {
      _resultState = ListNoneState();
      notifyListeners();
      return;
    }

    try {
      _resultState = ListLoadingState();
      notifyListeners();

      final result = await _apiServices.searchRestaurant(query);

      if (result.isEmpty) {
        _resultState = ListErrorState('Restaurant not found');
      } else {
        _resultState = ListLoadedState(result);
      }
      notifyListeners();
    } catch (e) {
      _resultState = ListErrorState("Unable to retrieve search results. Please check your connection and try again.");
      notifyListeners();
    }
  }
}