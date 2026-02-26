import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:slurp_restaurant_app/data/api/api_services.dart';
import 'package:slurp_restaurant_app/data/model/restaurant_list.dart';
import 'package:slurp_restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:slurp_restaurant_app/static/list_result_state.dart';

class MockApiServices extends Mock implements ApiServices {}

void main() {
  late MockApiServices mockApiServices;
  late RestaurantListProvider restaurantListProvider;

  setUp(() {
    mockApiServices = MockApiServices();
    restaurantListProvider = RestaurantListProvider(mockApiServices);
  });

  group('RestaurantListProvider', () {
    test('initial state should be ListNoneState', () {
      expect(restaurantListProvider.resultState, isA<ListNoneState>());
    });

    test('should return restaurant list when API call succeeds', () async {
      // Arrange
      final dummyRestaurant = Restaurant(
        id: "1",
        name: "Resto Slurp",
        description: "Enak",
        pictureId: "12",
        city: "Depok",
        rating: 5.0,
      );
      final dummyResponse = RestaurantListResponse(
        error: false,
        message: "success",
        count: 1,
        restaurants: [dummyRestaurant],
      );

      when(() => mockApiServices.getRestaurantList())
          .thenAnswer((_) async => dummyResponse);

      // Act
      await restaurantListProvider.fetchRestaurantList();

      // Assert
      expect(restaurantListProvider.resultState, isA<ListLoadedState>());

      final state = restaurantListProvider.resultState as ListLoadedState;
      expect(state.restaurants.length, 1);
      expect(state.restaurants.first.name, "Resto Slurp");
    });

    test('should return error state when API call fails', () async {
      // Arrange
      when(() => mockApiServices.getRestaurantList())
          .thenThrow(Exception('Failed to load restaurant list'));

      // Act
      await restaurantListProvider.fetchRestaurantList();

      // Assert
      expect(restaurantListProvider.resultState, isA<ListErrorState>());
    });
  });
}