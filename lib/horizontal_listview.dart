
import 'package:flutter/material.dart';
import 'package:provder_food/model.dart';

Widget horizontalListView(double height, double width, MyPageModel model) {
    return SizedBox(
      height: height * 0.235,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              model.selectItem(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                decoration: BoxDecoration(
                    color: model.selectedItemIndex == index
                        ? Colors.red.shade300
                        : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: const [
                      BoxShadow(color: Color.fromARGB(255, 96, 95, 95))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                      child: Image.asset(model.imagePaths[index]),
                    ),
                    Text(
                      model.foodNames[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height * 0.1,
                        width: width * 0.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: model.selectedItemIndex == index
                              ? Colors.white
                              : Colors.red,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: model.selectedItemIndex == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }