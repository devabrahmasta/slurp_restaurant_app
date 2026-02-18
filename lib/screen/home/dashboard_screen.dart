import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/screen/home/widget/chip_widget.dart';
import 'package:slurp_restaurant_app/screen/home/widget/resto_card.dart';
import 'package:slurp_restaurant_app/screen/home/widget/search_widget.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.restaurant_rounded, 'label': 'All'},
      {'icon': Icons.emoji_food_beverage_rounded, 'label': 'Coffee'},
      {'icon': Icons.fastfood_rounded, 'label': 'Fastfood'},
      {'icon': Icons.local_pizza_rounded, 'label': 'Pizza'},
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                  ),
                ),
                const SizedBox.square(dimension: 16.0),

                // Search bar
                CustomSearchBar(hintText: 'Search restaurants...'),
                const SizedBox.square(dimension: 16.0),

                // Categories
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: CustomChip(
                          label: categories[index]['label'],
                          icon: categories[index]['icon'],
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox.square(dimension: 24.0),

                // Headline
                header(context, 'Popular Nearby'),
                const SizedBox.square(dimension: 16.0),

                // Card
                RestoCard(
                  src:
                      'https://platform.la.eater.com/wp-content/uploads/sites/26/chorus/uploads/chorus_asset/file/22945247/2021_10_20_Belles_012.jpg?quality=90&strip=all&crop=0%2C0.065980469780946%2C100%2C99.868039060438&w=1440',
                  name: 'Gastro',
                  address: '123 Sleman Regency',
                  rating: 4.8,
                  time: '20-30 min',
                ),
              ],
            ),
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
          style: context.text.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   child: Text(
        //     'See All',
        //     style: context.text.bodyMedium?.copyWith(
        //       color: Theme.of(context).colorScheme.primary,
        //       fontWeight: FontWeight.w700,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
