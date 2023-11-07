

import 'package:flutter/material.dart';
import 'package:provder_food/horizontal_listview.dart';
import 'package:provder_food/model.dart';
import 'package:provder_food/vertical_listview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    ),
  );
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyPageModel(),
      child: Scaffold(
        body: MyPageContent(),
      ),
    );
  }
}


class MyPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    final myPageModel = Provider.of<MyPageModel>(context);

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Get your food',
                style: TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 31, 28, 28))),
            const Text('Delivered!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w900)),
            const Text('Categories',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: height * 0.02,
            ),
            horizontalListView(height, width, myPageModel),
            SizedBox(
              height: height * 0.01,
            ),
            const Text('Flavors',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 31, 28, 28),
                )),
            SizedBox(
              height: height * 0.01,
            ),
            if (myPageModel.selectedItemIndex != -1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalListView(height, width, myPageModel),
                ],
              ),
            SizedBox(
              height: height * 0.07,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        '(${myPageModel.selectedItemsCount})',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      'Items',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        'Add to Bill',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}