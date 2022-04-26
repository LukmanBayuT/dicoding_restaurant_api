// To parse this JSON data, do
//
//     final restaurantReview = restaurantReviewFromJson(jsonString);

import 'dart:convert';

RestaurantReview restaurantReviewFromJson(String str) =>
    RestaurantReview.fromJson(json.decode(str));

String restaurantReviewToJson(RestaurantReview data) =>
    json.encode(data.toJson());

class RestaurantReview {
  final bool? error;
  final String? message;
  final List<CustomerReview>? customerReviews;

  RestaurantReview({
    this.error,
    this.message,
    this.customerReviews,
  });

  factory RestaurantReview.fromJson(Map<String, dynamic> json) =>
      RestaurantReview(
        error: json["error"],
        message: json["message"],
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "customerReviews":
            List<dynamic>.from(customerReviews!.map((x) => x.toJson())),
      };
}

class CustomerReview {
  final String? name;
  final String? review;
  final String? date;

  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "date": date,
      };
}
