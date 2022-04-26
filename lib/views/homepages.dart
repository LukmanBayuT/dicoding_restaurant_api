import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:restaurantsapp/const/base_url.dart';
import 'package:restaurantsapp/const/constant.dart';
import 'package:restaurantsapp/service/provider_service.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  var spinkit = const SpinKitRotatingCircle(
    color: Colors.amber,
    size: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant App',
          style: h1White,
        ),
        centerTitle: true,
      ),
      body: postModel.loading
          ? Center(
              child: spinkit,
            )
          : ListView.builder(
              itemCount: postModel.post?.restaurants!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: Image.network(EndPoint
                                    .restaurantPictureSmall +
                                postModel.post!.restaurants![index].pictureId
                                    .toString()),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postModel.post?.restaurants![index].name
                                      .toString() ??
                                  "",
                              style: h3Black,
                            ),
                            Text(
                              postModel.post?.restaurants![index].city
                                      .toString() ??
                                  "",
                              style: h4Black,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.stars,
                                  size: 20,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  postModel.post?.restaurants![index].rating
                                          .toString() ??
                                      "",
                                  style: h4Black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
