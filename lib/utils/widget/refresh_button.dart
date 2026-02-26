import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/provider/home/restaurant_list_provider.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: const ValueKey("refreshButton"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () {
        context.read<RestaurantListProvider>().fetchRestaurantList();
      },
      label: const Text("Refresh Data"),
    );
  }
}
