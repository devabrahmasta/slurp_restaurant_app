import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:slurp_restaurant_app/data/model/restaurant_detail.dart';
import 'package:slurp_restaurant_app/provider/detail/restaurant_detail_provider.dart';
// import 'package:slurp_restaurant_app/screen/detail/bookmark_button_widget.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.restaurantId,
  });

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
    final double _coverHeight = 300;
    // final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Resto Cover
              SizedBox(
                height: _coverHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    'https://platform.la.eater.com/wp-content/uploads/sites/26/chorus/uploads/chorus_asset/file/22945247/2021_10_20_Belles_012.jpg?quality=90&strip=all&crop=0%2C0.065980469780946%2C100%2C99.868039060438&w=1440',
                    fit: BoxFit.fitHeight,
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        ),
                        IconButton.filledTonal(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black38,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox.square(dimension: 120),
      
                  // Resto Information
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 120,
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
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
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
                                        borderRadius: BorderRadius.circular(
                                          20.0,
                                        ),
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
                                    Text(
                                      '123 Culinary bla bal bla',
                                      style: context.text.labelSmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                SizedBox.square(dimension: 10),
      
                                Divider(),
                                // SizedBox.square(dimension: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
      
                  // About
                  header(context, 'About', null),
                  SizedBox.square(dimension: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                      style: context.text.labelSmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
      
                  header(context, 'Popular Menu', 'See All'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget header(BuildContext context, String title, String? button) {
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
          if (button != null && button.isNotEmpty)
            TextButton(
              onPressed: () {},
              child: Text(
                button,
                style: context.text.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
