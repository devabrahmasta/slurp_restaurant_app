import 'dart:convert';
import 'package:slurp_restaurant_app/data/model/restaurant_detail.dart';
import 'package:slurp_restaurant_app/data/model/restaurant_list.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

  Future<bool> addReview(String id, String name, String review) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/review"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": id, "name": name, "review": review}),
    );

    if (response.statusCode == 200 || response.statusCode == 201 ) {
      return true; 
    } else {
      throw Exception('Failed to post review');
    }
  }

  Future<List<Restaurant>> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$query"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Restaurant>.from(
        data["restaurants"].map((x) => Restaurant.fromJson(x))
      );
    } else {
      throw Exception('Failed to search restaurant');
    }
  }
}
