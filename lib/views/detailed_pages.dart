import 'package:flutter/material.dart';
import 'package:restaurantsapp/const/base_url.dart';
import 'package:restaurantsapp/models/restaurant_list_models.dart';

class DetailedPages extends StatelessWidget {
  RestaurantsList? data;

  DetailedPages({Key? key, RestaurantsList? this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                EndPoint.restaurantPictureSmall +
                    data!.restaurants![1].pictureId.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
