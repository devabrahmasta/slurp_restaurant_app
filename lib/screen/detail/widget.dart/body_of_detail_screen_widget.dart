import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/data/model/restaurant_detail.dart';
import 'package:slurp_restaurant_app/provider/detail/favorite_provider.dart';
import 'package:slurp_restaurant_app/screen/detail/widget.dart/add_review.dart';
import 'package:slurp_restaurant_app/screen/detail/widget.dart/category_chip_widget.dart';
import 'package:slurp_restaurant_app/screen/detail/widget.dart/menu_card.dart';
import 'package:slurp_restaurant_app/screen/detail/widget.dart/review_card.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({super.key, required this.restaurant});

  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    final backgroundCard = Theme.of(context).colorScheme.surfaceBright;
    final backgroundRating = Theme.of(context).colorScheme.onSecondary;
    final backgroundError = Theme.of(context).colorScheme.surfaceContainer;
    final border = Theme.of(context).colorScheme.outline;
    final iconColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final textSecond = Theme.of(context).colorScheme.onSurfaceVariant;

    final double coverHeight = 300;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
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
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(Icons.image_not_supported_sharp),
                        );
                      },
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
                        borderRadius: BorderRadius.circular(20),
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
                                Expanded(
                                  child: Text(
                                    restaurant.name,
                                    style: context.text.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: textColor,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox.square(dimension: 8),
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
                                Expanded(
                                  child: Text(
                                    '${restaurant.address}, ${restaurant.city}',
                                    style: context.text.bodyMedium?.copyWith(
                                      color: textSecond,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox.square(dimension: 5),
                            Divider(),
                            const SizedBox.square(dimension: 5),
                            SizedBox(
                              height: 32,
                              child: ListView.builder(
                                itemCount: restaurant.categories.length,
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final category =
                                      restaurant.categories[index].name;

                                  return CategoryWidget(
                                    text: category.toString(),
                                    backgroundRating: backgroundRating,
                                    border: border,
                                    iconColor: iconColor,
                                  );
                                },
                              ),
                            ),
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
                        color: textSecond,
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
                      padding: EdgeInsets.zero,
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
                  const SizedBox.square(dimension: 16),

                  // Menus - Drinks
                  header(context, 'Popular Drink'),
                  const SizedBox.square(dimension: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
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
                  const SizedBox.square(dimension: 16),

                  // Review
                  header(
                    context,
                    'Reviews',
                    button: 'Add Review',
                    icon: Icons.add,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AddReviewDialog(restaurantId: restaurant.id),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: restaurant.customerReviews.length,
                      itemBuilder: (context, index) {
                        final review = restaurant.customerReviews[index];

                        return ReviewCard(
                          backgroundCard: backgroundCard,
                          backgroundError: backgroundError,
                          name: review.name,
                          review: review.review,
                          date: review.date,
                          textColor: textColor,
                          textSecond: textSecond,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget header(
    BuildContext context,
    String title, {
    String? button,
    IconData? icon,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.text.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (button != null)
            FilledButton.tonalIcon(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),
              icon: Icon(icon),
              onPressed: onPressed,
              label: Text(
                button,
                style: context.text.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
