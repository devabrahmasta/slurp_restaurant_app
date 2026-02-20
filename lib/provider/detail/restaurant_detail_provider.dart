import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/data/api/api_services.dart';
import 'package:slurp_restaurant_app/static/detail_result_state.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantDetailProvider(this._apiServices);

  DetailResultState _resultState = DetailNoneState();
  DetailResultState get resultState => _resultState;

  Future<void> fetchRestaurantDetail(String id) async {
    try {
      _resultState = DetailLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestaurantDetail(id);

      if (result.error) {
        _resultState = DetailErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = DetailLoadedState(result.restaurant);
        notifyListeners();
      }
    } catch (e) {
      _resultState = DetailErrorState(
        "Failed to load restaurant details. Please try again later.",
      );
      notifyListeners();
    }
  }

  Future<bool> submitReview(String id, String name, String review) async {
    try {
      final isSuccess = await _apiServices.addReview(id, name, review);

      if (isSuccess) {
        await fetchRestaurantDetail(id);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
