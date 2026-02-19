import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:slurp_restaurant_app/data/model/restaurant_list.dart';
// import 'package:slurp_restaurant_app/provider/detail/favorite_provider.dart';
import 'package:slurp_restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:slurp_restaurant_app/screen/detail/widget.dart/body_of_detail_screen_widget.dart';
import 'package:slurp_restaurant_app/static/detail_result_state.dart';
// import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';
// import 'package:slurp_restaurant_app/screen/detail/bookmark_button_widget.dart';
// import 'package:slurp_restaurant_app/data/model/restaurant_detail.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<RestaurantDetailProvider>().fetchRestaurantDetail(
        widget.restaurantId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            DetailLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
            DetailLoadedState(restaurant: var restaurant) =>
              BodyOfDetailScreenWidget(restaurant: restaurant),
            DetailErrorState(error: var message) => Center(
              child: Text(message),
            ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }

  
}
