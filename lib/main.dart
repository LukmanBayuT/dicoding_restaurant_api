import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:restaurantsapp/service/provider_service.dart';
import 'package:restaurantsapp/views/homepages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataClass()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurants With Provider',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomePages(),
      ),
    );
  }
}
