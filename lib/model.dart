import 'package:flutter/material.dart';

class MyPageModel with ChangeNotifier {
  int selectedItemIndex = -1;
  int selectedItemsCount = 0;
  final List<String> imagePaths = [
    'assets/images/burger.png',
    'assets/images/fries.png',
    'assets/images/wings.png',
  ];
  final List<String> foodNames = [
    'Burger',
    'Fries',
    'Wings',
  ];
  List<List<bool>> isOrderedList = [
    [false, false, false],
    [false, false, false],
    [false, false, false],
  ];
  final List<List<String>> prices = [
    ['850/', '950/', '740/'],
    ['370/', '345/', '245/'],
    ['550/', '450/', '600/'],
  ];
  List<int> quantities = [0, 0, 0];

  void toggleCheckbox(int itemIndex, int index) {
    isOrderedList[itemIndex][index] = !isOrderedList[itemIndex][index];
    // Update selectedItemsCount for the specific item
    if (isOrderedList[itemIndex][index]) {
      selectedItemsCount++;
    } else {
      selectedItemsCount--;
    }
    notifyListeners();
  }

  void selectItem(int index) {
    selectedItemIndex = index;
    notifyListeners();
  }
}
