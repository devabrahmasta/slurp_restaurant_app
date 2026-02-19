import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:slurp_restaurant_app/screen/home/widget/resto_card.dart';
import 'package:slurp_restaurant_app/screen/home/widget/search_widget.dart';
import 'package:slurp_restaurant_app/static/list_result_state.dart';
import 'package:slurp_restaurant_app/static/navigation_route.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                'Good Morning,',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.bodyMedium?.copyWith(color: Colors.grey),
              ),
              Text(
                'Hungry Today?',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
              const SizedBox.square(dimension: 16.0),

              // Search bar
              CustomSearchBar(hintText: 'Search restaurants...'),
              const SizedBox.square(dimension: 16.0),

              // Headline
              header(context, 'Popular Nearby'),
              const SizedBox.square(dimension: 16.0),

              // Card
              Expanded(
                child: Consumer<RestaurantListProvider>(
                  builder: (context, value, child) {
                    return switch (value.resultState) {
                      ListLoadingState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      ListLoadedState(restaurants: var restaurantList) =>
                        ListView.builder(
                          scrollDirection: Axis.vertical,
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
                        child: Text(message),
                      ),
                      _ => const SizedBox(),
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

  Widget header(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

}
