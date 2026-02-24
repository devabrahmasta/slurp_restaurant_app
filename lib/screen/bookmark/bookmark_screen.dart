import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/provider/bookmark/local_database_provider.dart';
import 'package:slurp_restaurant_app/screen/home/widget/resto_card.dart';
import 'package:slurp_restaurant_app/static/navigation_route.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<LocalDatabaseProvider>().loadAllFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      appBar: AppBar(
        title: const Text("Bookmark List", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      body: Consumer<LocalDatabaseProvider>(
        builder: (context, value, child) {
          final favoriteList = value.favoriteList ?? [];

          if (favoriteList.isEmpty) {
            return const Center(child: Text('No bookmarks yet!'));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              final restaurant = favoriteList[index];
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
          );
        },
      ),
    );
  }
}