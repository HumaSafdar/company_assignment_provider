
import 'package:flutter/material.dart';
import 'package:provder_food/model.dart';

Widget verticalListView(double height, double width, MyPageModel model) {
    return SizedBox(
      height: height * 0.4,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: model.prices[model.selectedItemIndex].length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(17)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Checkbox(
                        activeColor: Colors.red,
                        onChanged: (value) {
                          model.toggleCheckbox(model.selectedItemIndex, index);
                        },
                        value: model.isOrderedList[model.selectedItemIndex]
                            [index],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.1,
                      width: width * 0.32,
                      child: Image.asset(
                          model.imagePaths[model.selectedItemIndex]),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.01),
                      SizedBox(
                        width: width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              model.foodNames[model.selectedItemIndex],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(width: width * 0.25),
                            Container(
                              width: width * 0.06,
                              height: height * 0.03,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 149, 152, 149),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    if (model.quantities[index] > 0) {
                                      model.quantities[index]--;
                                    }
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                              ),
                            ),
                            Text(
                              model.quantities[index].toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Container(
                              width: width * 0.06,
                              height: height * 0.03,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    model.quantities[index]++;
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'RS.',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            model.prices[model.selectedItemIndex][index],
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.001),
                      Row(
                        children: [
                          const Text(
                            'Size',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: width * 0.16),
                          const Text(
                            'Other',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        children: [
                          Container(
                            width: width * 0.2,
                            height: height * 0.04,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(221, 145, 143, 143),
                                width: 2.0,
                              ),
                            ),
                            child:  Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '2x',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Container(
                            width: width * 0.4,
                            height: height * 0.04,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(221, 145, 143, 143),
                                width: 2.0,
                              ),
                            ),
                            child:  Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Extra Cheese Layer',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }