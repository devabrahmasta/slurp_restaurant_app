import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/data/model/restaurant_list.dart';
import 'package:slurp_restaurant_app/provider/bookmark/favorite_icon_provider.dart';
import 'package:slurp_restaurant_app/provider/bookmark/local_database_provider.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  void initState() {
    super.initState();
    final localDatabaseProvider = context.read<LocalDatabaseProvider>();
    final favoriteIconProvider = context.read<FavoriteIconProvider>();

    Future.microtask(() async {
      await localDatabaseProvider.loadAllFavorite();
      final value = localDatabaseProvider.checkItemFavorite(
        widget.restaurant.id,
      );

      favoriteIconProvider.setFavorited(widget.restaurant.id, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteIconProvider>(
      builder: (context, provider, child) {
        final isFavorited = provider.isFavorited(widget.restaurant.id);

        return IconButton.filledTonal(
          key: const ValueKey("favoriteButton"),
          style: IconButton.styleFrom(backgroundColor: Colors.black38),
          onPressed: () async {
            final localDatabaseProvider = context.read<LocalDatabaseProvider>();

            if (!isFavorited) {
              await localDatabaseProvider.saveFavorite(widget.restaurant);
            } else {
              await localDatabaseProvider.removeFavoriteById(
                widget.restaurant.id,
              );
            }

            provider.setFavorited(widget.restaurant.id, !isFavorited);
            localDatabaseProvider.loadAllFavorite();
          },
          icon: Icon(
            isFavorited ? Icons.favorite_rounded : Icons.favorite_outline,
            color: isFavorited ? Colors.red : Colors.white,
          ),
        );
      },
    );
  }
}
