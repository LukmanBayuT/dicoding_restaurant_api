import 'package:flutter/material.dart';
import 'package:restaurantsapp/const/base_url.dart';
import 'package:restaurantsapp/models/restaurant_list_models.dart';
import 'package:restaurantsapp/service/api_service.dart';
import 'package:restaurantsapp/service/secure_storage.dart';

class DetailedPages extends StatefulWidget {
  String? data;

  DetailedPages({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailedPages> createState() => _DetailedPagesState();
}

class _DetailedPagesState extends State<DetailedPages> {
  SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    super.initState();
    ApiServiceRestaurant().getRestaurantDetails(widget.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8),
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width,
          //     child: Image.network(
          //       EndPoint.restaurantPictureSmall +
          //           widget.data!.restaurants![1].pictureId.toString(),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
