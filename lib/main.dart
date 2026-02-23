import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slurp_restaurant_app/data/api/api_services.dart';
import 'package:slurp_restaurant_app/provider/detail/favorite_provider.dart';
import 'package:slurp_restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:slurp_restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:slurp_restaurant_app/provider/home/restaurant_search_provider.dart';
import 'package:slurp_restaurant_app/provider/setting/shared_preferences_service.dart';
import 'package:slurp_restaurant_app/provider/setting/theme_state_provider.dart';
import 'package:slurp_restaurant_app/screen/detail/detail_screen.dart';
import 'package:slurp_restaurant_app/screen/home/dashboard_screen.dart';
import 'package:slurp_restaurant_app/screen/home/search_screen.dart';
import 'package:slurp_restaurant_app/screen/setting/setting_screen.dart';
import 'package:slurp_restaurant_app/services/shared_preferences_service.dart';
import 'package:slurp_restaurant_app/static/navigation_route.dart';
import 'package:slurp_restaurant_app/utils/theme/material.dart';
import 'package:slurp_restaurant_app/utils/theme/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),

        Provider(create: (context) => ApiServices()),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantListProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantDetailProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantSearchProvider(context.read<ApiServices>()),
        ),

        ChangeNotifierProvider(create: (context) => ThemeStateProvider()),
        Provider(create: (context) => SharedPreferencesService(prefs)),
        ChangeNotifierProvider(
          create: (context) => SharedPreferencesProvider(
            context.read<SharedPreferencesService>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);


    return MaterialApp(
      title: 'Slurp',
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: context.watch<ThemeStateProvider>().currentThemeMode,
      initialRoute: NavigationRoute.settingRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const DashboardScreen(),
        NavigationRoute.searchRoute.name: (context) => const SearchScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
          restaurantId: ModalRoute.of(context)?.settings.arguments as String,
        ),
        NavigationRoute.settingRoute.name: (context) => const SettingScreen(),
      },
    );
  }
}
