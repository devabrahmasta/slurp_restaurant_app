import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'robot/evaluate_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Integrasi End-to-End: Home, Search, Review, Favorite, Bookmark, and Setting", (tester) async {
    final robot = SlurpApp(tester);

    await robot.loadApp();
    await robot.checkRestoCardOrRefresh();

    await robot.tapSearchOnDashboard();

    await robot.testSearch("xyz", "kafe");

    await robot.tapFirstRestoCard();

    await robot.testReview("Dicoding", "Ini review dari Integration Test");

    await robot.toggleFavoriteAndGoHome();

    await robot.testBookmarkMenu();

    await robot.testSettings();
  });
}