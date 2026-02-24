import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/data/local/local_database_service.dart';
import 'package:slurp_restaurant_app/data/model/restaurant_list.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  final LocalDatabaseService _service;

  LocalDatabaseProvider(this._service) {
    loadAllFavorite();
  }

  String _message = "";
  String get message => _message;

  List<Restaurant>? _favoriteList;
  List<Restaurant>? get favoriteList => _favoriteList;

  Restaurant? _restaurant;
  Restaurant? get restaurant => _restaurant;

  Future<void> saveFavorite(Restaurant value) async {
    try {
      final result = await _service.insertItem(value);

      final isError = result == 0;
      if (isError) {
        _message = "Failed to save your data";
      } else {
        _message = "Your data is saved";
      }
      await loadAllFavorite();
    } catch (e) {
      _message = "Failed to save your data";
    }
    notifyListeners();
  }

  Future<void> loadAllFavorite() async {
    try {
      _favoriteList = await _service.getAllItems();
      _restaurant = null;
      _message = "All of your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your all data";
      notifyListeners();
    }
  }

  Future<void> loadFavoriteById(String id) async {
    try {
      _restaurant = await _service.getItemById(id);
      _message = "Your data is loaded";
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      notifyListeners();
    }
  }

  Future<void> removeFavoriteById(String id) async {
    try {
      await _service.removeItem(id);
      _message = "Your data is removed";
      notifyListeners();
    } catch (e) {
      _message = "Failed to remove your data";
      notifyListeners();
    }
  }

  bool checkItemFavorite(String id) {
    final isExist = _favoriteList?.any((element) => element.id == id) ?? false;
    return isExist;
  }
}
