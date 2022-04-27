// ignore_for_file: empty_catches

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:restaurantsapp/const/base_url.dart';
import 'package:restaurantsapp/models/restaurant_detail_models.dart';
import 'package:restaurantsapp/models/restaurant_list_models.dart';

class ApiServiceRestaurant {
  Future<RestaurantsList?> getRestaurantList() async {
    RestaurantsList? restaurantList;

    try {
      final response = await http
          .get(Uri.parse(EndPoint.baseApiUrl + EndPoint.restaurantList));
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        return restaurantList = restaurantsListFromJson(response.body);
      } else {
        Future.delayed(const Duration(seconds: 1))
            .then((value) => getRestaurantList());
      }
    } catch (e) {}
    return restaurantList;
  }

  Future<RestaurantDetails?> getRestaurantDetails(String id) async {
    final response =
        await http.get(Uri.parse(EndPoint.baseApiUrl + '/detail/$id'));
    if (kDebugMode) {
      print(response.body);
    }
    return restaurantDetailsFromJson(response.body);
  }
}
