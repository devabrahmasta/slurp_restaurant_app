import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/screen/home/widget/chip_widget.dart';
import 'package:slurp_restaurant_app/screen/home/widget/search_widget.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.restaurant_rounded, 'label': 'All'},
      {'icon': Icons.emoji_food_beverage_rounded, 'label': 'Coffee'},
      {'icon': Icons.fastfood_rounded, 'label': 'Fastfood'},
      {'icon': Icons.local_pizza_rounded, 'label': 'Pizza'},
    ];

    return Scaffold(
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
                      return CustomChip(
                        label: categories[index]['label'],
                        icon: categories[index]['icon'],
                        isSelected: selectedIndex == index,
                        onTap: () {},
                      );
                    },
                  ),
                ),
                const SizedBox.square(dimension: 16.0),

                // Headline
                header(context, 'Popular Nearby'),
                const SizedBox.square(dimension: 16.0),

                // Card
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 4),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          // Image
                          SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(20),
                              ),
                              child: Image.network(
                                'https://platform.la.eater.com/wp-content/uploads/sites/26/chorus/uploads/chorus_asset/file/22945247/2021_10_20_Belles_012.jpg?quality=90&strip=all&crop=0%2C0.065980469780946%2C100%2C99.868039060438&w=1440',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),

                          // Bookmarks
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton.filledTonal(
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white38,
                              ),
                              onPressed: () {}, 
                              icon: Icon(Icons.favorite, color: Colors.red),
                            ),
                          ),

                          // waktu tunggu
                          Positioned(
                            bottom: 8,
                            left: 8,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                              child: Text(
                                '20-30 min',
                                style: context.text.labelSmall,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Gastro'),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.green,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.star_rounded, size: 15),
                                        SizedBox.square(dimension: 5),
                                        Text(
                                          '4.8',
                                          style: context.text.labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // Location
                              Row(
                                children: [
                                  Icon(Icons.location_on_rounded, size: 15),
                                  SizedBox.square(dimension: 5),
                                  Text('123 Culinary bla bal bla', style: context.text.labelSmall),
                                ],
                              ),



                            ],
                          ),
                        ),
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

  Widget header(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.text.titleMedium),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: context.text.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
