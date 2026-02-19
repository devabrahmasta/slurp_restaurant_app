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
    final backgroundRating = Theme.of(context).colorScheme.secondaryContainer;
    final ratingColor = Theme.of(context).colorScheme.primary;

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
                            topRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            'https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image_not_supported_rounded);
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

                    // waktu tunggu
                    // Positioned(
                    //   bottom: 8,
                    //   left: 8,
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //       color: Colors.white,
                    //     ),
                    //     child: Text(time, style: context.text.labelSmall),
                    //   ),
                    // ),
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
                          Text(
                            restaurant.name,
                            style: context.text.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: backgroundRating,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 15,
                                  color: ratingColor,
                                ),
                                SizedBox.square(dimension: 5),
                                Text(
                                  restaurant.rating.toString(),
                                  style: context.text.labelSmall?.copyWith(
                                    color: ratingColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Address
                      Row(
                        children: [
                          Icon(Icons.location_on_rounded, size: 15),
                          SizedBox.square(dimension: 5),
                          Text(restaurant.city, style: context.text.labelSmall),
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
