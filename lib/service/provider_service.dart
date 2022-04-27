import 'package:flutter/foundation.dart';
import 'package:restaurantsapp/models/restaurant_list_models.dart';
import 'package:restaurantsapp/service/api_service.dart';

class DataClass extends ChangeNotifier {
  RestaurantsList? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = await ApiServiceRestaurant().getRestaurantList();
    loading = false;

    notifyListeners();
  }
}
