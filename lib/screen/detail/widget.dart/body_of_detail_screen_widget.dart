import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/data/model/restaurant_detail.dart';
import 'package:slurp_restaurant_app/provider/detail/favorite_provider.dart';
import 'package:slurp_restaurant_app/screen/detail/widget.dart/category_widget.dart';
import 'package:slurp_restaurant_app/screen/detail/widget.dart/menu_card.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({super.key, required this.restaurant});

  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    final backgroundCard = Theme.of(context).colorScheme.surfaceBright;
    final backgroundRating = Theme.of(context).colorScheme.primaryContainer;
    final border = Theme.of(context).colorScheme.outline;
    final iconColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final textSecond = Theme.of(context).colorScheme.onSurfaceVariant;

    final double coverHeight = 300;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Resto Cover
              Hero(
                tag: restaurant.pictureId,
                child: SizedBox(
                  height: coverHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),

              // Navigation Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton.filledTonal(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black38,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        ),
                        Consumer<FavoriteProvider>(
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
                      ],
                    ),
                  ),
                  SizedBox.square(dimension: coverHeight * 0.4),

                  // Resto Information
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: backgroundCard,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  restaurant.name,
                                  style: context.text.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: textColor,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
                                      SizedBox.square(dimension: 5),
                                      Text(
                                        restaurant.rating.toString(),
                                        style: context.text.bodyMedium
                                            ?.copyWith(
                                              color: iconColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox.square(dimension: 10),

                            // Location
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                  color: iconColor,
                                ),
                                SizedBox.square(dimension: 5),
                                Text(
                                  restaurant.address,
                                  style: context.text.labelSmall?.copyWith(
                                    color: textSecond,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            SizedBox.square(dimension: 5),
                            Divider(),
                            SizedBox.square(dimension: 5),
                            // Expanded(
                            //   child: ListView.builder(
                            //     itemCount: restaurant.categories.length,
                            //     scrollDirection: Axis.horizontal,
                            //     physics: NeverScrollableScrollPhysics(),
                            //     itemBuilder: (context, index) {
                            //       final category = restaurant.categories[index];
                              
                            //       return CategoryWidget(
                            //         text: category.toString(),
                            //         backgroundRating: backgroundRating,
                            //         border: border,
                            //         iconColor: iconColor,
                            //       );
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // About
                  header(context, 'About'),
                  const SizedBox.square(dimension: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      restaurant.description,
                      style: context.text.labelSmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox.square(dimension: 16),

                  // Menus - Foods
                  header(context, 'Popular Menu'),
                  const SizedBox.square(dimension: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: restaurant.menus.foods.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final item = restaurant.menus.foods[index];

                        return MenuCard(name: item.name);
                      },
                    ),
                  ),

                  // Menus - Drinks
                  header(context, 'Popular Drink'),
                  const SizedBox.square(dimension: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: restaurant.menus.drinks.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final drink = restaurant.menus.drinks[index];

                        return MenuCard(name: drink.name);
                      },
                    ),
                  ),

                  // Review
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget header(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        style: context.text.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
