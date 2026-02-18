import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/data/api/api_services.dart';
import 'package:slurp_restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:slurp_restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:slurp_restaurant_app/screen/detail/detail_screen.dart';
import 'package:slurp_restaurant_app/screen/home/dashboard_screen.dart';
import 'package:slurp_restaurant_app/static/navigation_route.dart';
import 'package:slurp_restaurant_app/utils/theme/material.dart';
import 'package:slurp_restaurant_app/utils/theme/utils.dart';

void main() {
 runApp(
   MultiProvider(
     providers: [
      //  ChangeNotifierProvider(
      //    create: (context) => IndexNavProvider(),
      //  ),
      //  ChangeNotifierProvider(
      //    create: (context) => BookmarkListProvider(),
      //  ),
       Provider(
         create: (context) => ApiServices(),
       ),
       ChangeNotifierProvider(
         create: (context) => RestaurantListProvider(
           context.read<ApiServices>(),
         ),
       ),
       ChangeNotifierProvider(
         create: (context) => RestaurantDetailProvider(
           context.read<ApiServices>(),
         ),
       ),
       
     ],
     child: const MyApp(),
   ),
 );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const DashboardScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
            restaurantId: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
    );
  }
}
