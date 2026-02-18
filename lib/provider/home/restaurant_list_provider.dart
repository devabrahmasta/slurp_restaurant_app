import 'package:flutter/widgets.dart';
import 'package:slurp_restaurant_app/data/api/api_services.dart';
import 'package:slurp_restaurant_app/static/list_result_state.dart';

class RestaurantListProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantListProvider(this._apiServices);

  ListResultState _resultState = ListNoneState();
  ListResultState get resultState => _resultState;

  Future<void> fetchRestaurantList() async {
    try {
      _resultState = ListLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestaurantList();

      if (result.error) {
        _resultState = ListErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = ListLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = ListErrorState(e.toString());
      notifyListeners();
    }
  }
}
