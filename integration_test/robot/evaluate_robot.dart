import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slurp_restaurant_app/main.dart' as app;
import 'package:slurp_restaurant_app/screen/home/widget/resto_card.dart';

class SlurpApp {
  final WidgetTester tester;

  const SlurpApp(this.tester);

  Future<void> loadApp() async {
    await app.main();
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }

  Future<void> checkRestoCardOrRefresh() async {
    final refreshButton = find.byKey(const ValueKey("refreshButton"));
    final cardFinder = find.byType(RestoCard);

    if (refreshButton.evaluate().isNotEmpty) {
      await tester.tap(refreshButton);
      await tester.pumpAndSettle(const Duration(seconds: 3));
    }

    expect(cardFinder, findsWidgets);

    final favoriteBtn = find.byKey(const ValueKey("favoriteButton")).first;
    await tester.tap(favoriteBtn);
    await tester.pumpAndSettle();
  }

  Future<void> tapSearchOnDashboard() async {
    final searchField = find.byKey(const ValueKey("searchBarDashboard"));
    await tester.tap(searchField);
    await tester.pumpAndSettle();
  }

  Future<void> testSearch(String wrongQuery, String correctQuery) async {
  final textField = find.byKey(const ValueKey("searchTextField"));

  await tester.enterText(textField, correctQuery);
  await tester.testTextInput.receiveAction(TextInputAction.done);

  await tester.pumpAndSettle(const Duration(seconds: 5));

  expect(find.byType(RestoCard), findsWidgets);
}

  Future<void> tapFirstRestoCard() async {
    final firstCard = find.byType(RestoCard).first;
    await tester.tap(firstCard);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> testReview(String name, String review) async {
    final addReviewBtn = find.byKey(const ValueKey("addReviewButton"));

    await tester.ensureVisible(addReviewBtn);
    await tester.pumpAndSettle();

    await tester.tap(addReviewBtn);
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const ValueKey("reviewNameField")), name);
    await tester.enterText(
      find.byKey(const ValueKey("reviewMessageField")),
      review,
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.tap(find.byKey(const ValueKey("reviewSubmitButton")));
    
    await tester.pumpAndSettle(const Duration(seconds: 4));

    final reviewTextFinder = find.text(review);
    await tester.ensureVisible(reviewTextFinder);
    expect(reviewTextFinder, findsWidgets);
  }

  Future<void> toggleFavoriteAndGoHome() async {
    final favoriteBtn = find.byKey(const ValueKey("favoriteButton")).first;

    await tester.ensureVisible(favoriteBtn);
    await tester.pumpAndSettle();

    await tester.tap(favoriteBtn);
    await tester.pumpAndSettle();

    final backBtn = find.byIcon(Icons.arrow_back_rounded);
    await tester.tap(backBtn);
    await tester.pumpAndSettle();

    final backBtnSearch = find.byType(BackButton);
    await tester.tap(backBtnSearch);
    await tester.pumpAndSettle();
  }

  Future<void> testBookmarkMenu() async {
    await tester.tap(find.byIcon(Icons.favorite_outline_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(RestoCard), findsWidgets);
    await tester.tap(find.byType(RestoCard).first);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey("favoriteButton")));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_back_rounded));
    await tester.pumpAndSettle();
  }

  Future<void> testSettings() async {
    await tester.tap(find.byIcon(Icons.person_outline_rounded));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey("themeMenuTile")));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey("radioLight")));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.byKey(const ValueKey("radioDark")));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.home_outlined));
    await tester.pumpAndSettle();
  }
}
