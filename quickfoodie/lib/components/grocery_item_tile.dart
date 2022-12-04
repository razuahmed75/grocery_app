import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/cart_model.dart';
import 'package:provider/provider.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final color;
  final void Function()? onPressed;

  const GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemPath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
/* ekhane home page theke contructor er maddhome pathano dataGulu receive krbe & manipulate krbe */
    /* sob seshe ei dataGulu homePage e list er length onujayi show krbe*/
    return Consumer<CartModel>(builder: ((context, value, child) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                itemPath,
                height: 64,
              ),
              Text(
                itemName,
                style: GoogleFonts.robotoMono(),
              ),
              MaterialButton(
                color: color[800],
                onPressed: onPressed,
                child: Text(
                  '\$' + itemPrice,
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
