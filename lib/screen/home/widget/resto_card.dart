import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/data/model/restaurant_list.dart';
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

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            margin: EdgeInsets.only(bottom: 16.0),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: backgroundCard,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 4),
                  blurRadius: 12.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    // Image
                    Hero(
                      tag: restaurant.id,
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
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),

                    // Bookmarks
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton.filledTonal(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black38,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.favorite, color: Colors.red),
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
                  child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              restaurant.name,
                              style: context.text.titleLarge?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
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
                            Text(
                              restaurant.city,
                              style: context.text.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
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
