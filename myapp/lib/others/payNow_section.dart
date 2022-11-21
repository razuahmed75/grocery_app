import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/cart_model.dart';
import 'package:provider/provider.dart';

class PayNow {
  static var payNow_section =
      Consumer<CartModel>(builder: ((context, value, child) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Container(
        padding: EdgeInsets.all(24),
        width: 400,
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.green),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total amount",
                  style: GoogleFonts.robotoMono(color: Colors.green[100]),
                ),
                Text(
                  '\$' + value.calculateTotal(),
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(130, 50),
                side: BorderSide(
                  width: 0.3,
                  color: Colors.white,
                ),
                elevation: 0,
                shadowColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pay Now",
                    style: GoogleFonts.robotoMono(color: Colors.green[100]),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }));
}
