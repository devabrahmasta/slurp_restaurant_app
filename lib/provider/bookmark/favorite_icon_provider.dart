import 'package:flutter/widgets.dart';

class FavoriteIconProvider extends ChangeNotifier {
  final Set<String> _favoritedIds = {};

  bool isFavorited(String id) {
    return _favoritedIds.contains(id);
  }

  void setFavorited(String id, bool isFavorite) {
    if (isFavorite) {
      _favoritedIds.add(id);
    } else {
      _favoritedIds.remove(id);
    }
    notifyListeners();
  }
}
