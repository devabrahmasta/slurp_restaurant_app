import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/data/model/restaurant_list.dart';
import 'package:slurp_restaurant_app/provider/detail/favorite_provider.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class RestoCard extends StatelessWidget {
  final Restaurant restaurant;
  final Function()? onTap;

  const RestoCard({super.key, required this.restaurant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final backgroundCard = Theme.of(context).colorScheme.surfaceBright;
    final backgroundRating = Theme.of(context).colorScheme.onSecondary;
    final backgroundError = Theme.of(context).colorScheme.surfaceContainer;
    final border = Theme.of(context).colorScheme.outline;
    final iconColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final textSecond = Theme.of(context).colorScheme.onSurfaceVariant;
    
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Card(
        color: backgroundCard,
        elevation: 4,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 250,
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    // Image
                    Hero(
                      tag: restaurant.pictureId,
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.network(
                            'https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: backgroundError,
                                ),
                                child: const Icon(
                                  Icons.image_not_supported_sharp,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // Favorite
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Consumer<FavoriteProvider>(
                        builder: (context, value, child) {
                          final isFavorite = value.isFavorite(restaurant.id);

                          return IconButton.filledTonal(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black38,
                            ),
                            onPressed: () {
                              value.toggleFavorite(restaurant.id);
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline,
                              color: isFavorite ? Colors.red : Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title
                          Expanded(
                            child: Text(
                              restaurant.name,
                              style: context.text.titleLarge?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: textColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox.square(dimension: 8),

                          // Rating
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: border),
                              color: backgroundRating,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 20,
                                  color: iconColor,
                                ),
                                const SizedBox.square(dimension: 5),
                                Text(
                                  restaurant.rating.toString(),
                                  style: context.text.bodyMedium?.copyWith(
                                    color: iconColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox.square(dimension: 10),

                      // Location
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 20,
                            color: iconColor,
                          ),
                          const SizedBox.square(dimension: 5),
                          Text(
                            restaurant.city,
                            style: context.text.bodySmall?.copyWith(
                              color: textSecond,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
