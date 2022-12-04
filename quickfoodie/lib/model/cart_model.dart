import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartModel extends ChangeNotifier {
  List _shopItems = [
    // /* [ itemName, itemPrice, itemPath, color],*/
    ['Avocado', '4.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '2.50', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '12.80', 'assets/images/chicken.png', Colors.brown],
    ['Water', '1.00', 'assets/images/water.png', Colors.blue],
    ['Orange', '3.30', 'assets/images/orange.png', Colors.orange],
    ['Apple', '5.75', 'assets/images/apple.png', Colors.red],
  ];

  List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;
  // /* home page theke click krle ekhane add hbe bcoz,... */
  // /*ekhane sei index chole ase & index jodi 1 hoy tahle seta _shopItems er
  //   list theke data add krte thakbe[ei bisoyTa ektu technically hoy]*/

  // /* ekhn data Show korate chaile cartItems theke nite hbe. bcoz,...*/
  // /* dataGulu ekhn ei list er mddhe chole asbe*/
  addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double _totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      _totalPrice += double.parse(_cartItems[i][1]);
    }
    return _totalPrice.toStringAsFixed(2);
  }
}
