import 'package:flutter/material.dart';
import 'package:restaurantsapp/const/constant.dart';
import 'package:restaurantsapp/models/restaurant_detail_models.dart';
import 'package:restaurantsapp/service/api_service.dart';

class DetailedPages extends StatefulWidget {
  String? data;

  DetailedPages({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailedPages> createState() => _DetailedPagesState();
}

class _DetailedPagesState extends State<DetailedPages> {
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
                if (snapshot.data != null) {
                  print(snapshot.data.restaurant.id);
                } else {
                  print('tidak ada data');
                }
              },
              child: Text(
                'Lafayete',
                style: h1Black,
              ));
        },
      ),
    );
  }
}
