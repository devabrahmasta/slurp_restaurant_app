import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/data/model/restaurant_list.dart';
import 'package:slurp_restaurant_app/provider/bookmark/favorite_icon_provider.dart';
import 'package:slurp_restaurant_app/provider/bookmark/local_database_provider.dart';
import 'package:slurp_restaurant_app/screen/home/widget/resto_card.dart';
import 'package:slurp_restaurant_app/screen/home/widget/search_widget.dart';

class MockLocalDatabaseProvider extends Mock implements LocalDatabaseProvider {}

void main() {
  group('Homes Screen Widget Test', () {
    
    testWidgets(
      'Memastikan RestoCard menampilkan Nama, Kota, Rating, dan Ikon Bintang',
      (WidgetTester tester) async {
        
        // Arrange
        final mockDbProvider = MockLocalDatabaseProvider();
        
        when(() => mockDbProvider.loadAllFavorite()).thenAnswer((_) async {});
        when(() => mockDbProvider.checkItemFavorite(any())).thenReturn(false);

        final dummyRestaurant = Restaurant(
          id: "1",
          name: "Kafe Kita",
          description: "Tempat yang nyaman",
          pictureId: "12",
          city: "Yogyakarta",
          rating: 4.8,
        );

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MultiProvider(
                providers: [
                  ChangeNotifierProvider<FavoriteIconProvider>(
                    create: (_) => FavoriteIconProvider(),
                  ),
                  ChangeNotifierProvider<LocalDatabaseProvider>(
                    create: (_) => mockDbProvider,
                  ),
                ],
                child: RestoCard(restaurant: dummyRestaurant, onTap: () {}),
              ),
            ),
          ),
        );

        // Assert
        final cardFinder = find.byType(Card);
        expect(cardFinder, findsOneWidget);

        final nameFinder = find.text("Kafe Kita");
        expect(nameFinder, findsOneWidget);

        final cityFinder = find.text("Yogyakarta");
        expect(cityFinder, findsOneWidget);

        final ratingFinder = find.text("4.8");
        expect(ratingFinder, findsOneWidget);

        expect(find.byIcon(Icons.star_rounded), findsOneWidget);
        expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
      },
    );

    testWidgets(
      'Memastikan SearchBar menampilkan Hint, dan Ikon Search',
      (WidgetTester tester) async {
        // Arrange
        const testHintText = 'Search Restaurant';
        const testPrefixIcon = Icons.search_rounded;

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomSearchBar(
                hintText: testHintText,
                prefixIcon: testPrefixIcon,
              ),
            ),
          ),
        );

        // Assert
        expect(find.text(testHintText), findsOneWidget);
        expect(find.byIcon(Icons.search_rounded), findsOneWidget);
      },
    );
  });
}