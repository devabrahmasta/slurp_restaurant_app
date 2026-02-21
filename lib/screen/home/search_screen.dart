import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/provider/home/restaurant_search_provider.dart';
import 'package:slurp_restaurant_app/screen/home/widget/resto_card.dart';
import 'package:slurp_restaurant_app/screen/home/widget/search_widget.dart';
import 'package:slurp_restaurant_app/static/list_result_state.dart';
import 'package:slurp_restaurant_app/static/navigation_route.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textSecond = Theme.of(context).colorScheme.onSurfaceVariant;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox.square(dimension: 15),
              Row(
                children: [
                  BackButton(),
                  const SizedBox.square(dimension: 10),
                  Expanded(
                    child: CustomSearchBar(
                      autofocus: true,
                      hintText: 'Search restaurants...',
                      onChanged: (query) {
                        context
                            .read<RestaurantSearchProvider>()
                            .searchRestaurant(query);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
                child: Consumer<RestaurantSearchProvider>(
                  builder: (context, provider, child) {
                    return switch (provider.resultState) {
                      ListNoneState() => Center(
                        child: Text(
                          'Type the restaurant name...',
                          style: context.text.bodyMedium?.copyWith(
                            color: textSecond,
                          ),
                        ),
                      ),
                      ListLoadingState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      ListLoadedState(restaurants: var restaurantList) =>
                        ListView.builder(
                          itemCount: restaurantList.length,
                          itemBuilder: (context, index) {
                            final restaurant = restaurantList[index];
                            return RestoCard(
                              restaurant: restaurant,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  NavigationRoute.detailRoute.name,
                                  arguments: restaurant.id,
                                );
                              },
                            );
                          },
                        ),
                      ListErrorState(error: var message) => Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainer,
                                radius: 64,
                                child: Icon(
                                  Icons.search_off_rounded,
                                  size: 64,
                                  color: textSecond,
                                ),
                              ),
                              const SizedBox.square(dimension: 16),
                              Text(
                                message,
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
