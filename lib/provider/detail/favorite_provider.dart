import 'package:flutter/foundation.dart';

class FavoriteProvider extends ChangeNotifier{
  final Set<String> _favoriteDataIds = {};

  bool isFavorite(String id) {
    return _favoriteDataIds.contains(id);
  }

  void toggleFavorite(String id) {
    if (_favoriteDataIds.contains(id)) {
      _favoriteDataIds.remove(id);
    } else {
      _favoriteDataIds.add(id);
    }
    notifyListeners(); 
  }
}