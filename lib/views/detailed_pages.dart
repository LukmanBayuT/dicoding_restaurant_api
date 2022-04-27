import 'package:flutter/material.dart';
import 'package:restaurantsapp/const/constant.dart';
import 'package:restaurantsapp/models/restaurant_detail_models.dart';
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
      body: FutureBuilder<RestaurantDetails?>(
        future:
            ApiServiceRestaurant().getRestaurantDetails(widget.data.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ElevatedButton(
              onPressed: () {
                print(snapshot.data);
              },
              child: Text(
                'check',
                style: h1Black,
              ));
        },
      ),
    );
  }
}
