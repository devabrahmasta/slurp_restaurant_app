import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slurp_restaurant_app/data/api/api_services.dart';
import 'package:slurp_restaurant_app/data/local/local_database_service.dart';
import 'package:slurp_restaurant_app/provider/bookmark/favorite_icon_provider.dart';
import 'package:slurp_restaurant_app/provider/bookmark/local_database_provider.dart';
import 'package:slurp_restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:slurp_restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:slurp_restaurant_app/provider/home/restaurant_search_provider.dart';
import 'package:slurp_restaurant_app/provider/main/index_nav_provider.dart';
import 'package:slurp_restaurant_app/provider/setting/shared_preferences_service.dart';
import 'package:slurp_restaurant_app/provider/setting/theme_state_provider.dart';
import 'package:slurp_restaurant_app/screen/detail/detail_screen.dart';
import 'package:slurp_restaurant_app/screen/home/search_screen.dart';
import 'package:slurp_restaurant_app/screen/main/main_screen.dart';
import 'package:slurp_restaurant_app/screen/setting/setting_screen.dart';
import 'package:slurp_restaurant_app/services/shared_preferences_service.dart';
import 'package:slurp_restaurant_app/static/navigation_route.dart';
import 'package:slurp_restaurant_app/utils/theme/material.dart';
import 'package:slurp_restaurant_app/utils/theme/utils.dart';
import 'package:slurp_restaurant_app/utils/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final sharedPrefService = SharedPreferencesService(prefs);
  
  final savedSetting = sharedPrefService.getSettingValue();
  final initialTheme = savedSetting.screenTheme.toThemeState();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexNavProvider(),
          child: const MyApp(),
        ),

        ChangeNotifierProvider(create: (context) => FavoriteIconProvider()),
        Provider(create: (context) => LocalDatabaseService()),
        ChangeNotifierProvider(
          create: (context) =>
              LocalDatabaseProvider(context.read<LocalDatabaseService>()),
        ),

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

        Provider.value(value: sharedPrefService),
        ChangeNotifierProvider(
          create: (context) => SharedPreferencesProvider(sharedPrefService),
        ),

        ChangeNotifierProvider(
          create: (context) {
            final themeProvider = ThemeStateProvider();
            themeProvider.themeState = initialTheme; // Set tema di awal!
            return themeProvider;
          },
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
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const MainScreen(),
        NavigationRoute.searchRoute.name: (context) => const SearchScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
          restaurantId: ModalRoute.of(context)?.settings.arguments as String,
        ),
        NavigationRoute.settingRoute.name: (context) => const SettingScreen(),
      },
    );
  }
}
