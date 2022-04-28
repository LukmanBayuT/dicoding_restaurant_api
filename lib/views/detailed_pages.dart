import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:restaurantsapp/const/base_url.dart';
import 'package:restaurantsapp/const/constant.dart';
import 'package:restaurantsapp/models/restaurant_detail_models.dart';
import 'package:restaurantsapp/service/api_service.dart';

class DetailedPages extends StatefulWidget {
  String? data;
  String? pict;

  DetailedPages({Key? key, required this.data, required this.pict})
      : super(key: key);

  @override
  State<DetailedPages> createState() => _DetailedPagesState();
}

class _DetailedPagesState extends State<DetailedPages> {
  var spinkit = const SpinKitRotatingCircle(
    color: Colors.amber,
    size: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<RestaurantDetails?>(
        future:
            ApiServiceRestaurant().getRestaurantDetails(widget.data.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var detail = snapshot.data.restaurant;
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    child: Image.network(EndPoint.restaurantPictureMedium +
                        widget.pict.toString()),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: spinkit,
            );
          }
        },
      ),
    );
  }
}
