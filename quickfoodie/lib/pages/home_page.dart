import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/grocery_item_tile.dart';
import 'package:myapp/model/cart_model.dart';
import 'package:myapp/pages/cart_pages.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Consumer<CartModel>(builder: ((context, value, child) {
        return FloatingActionButton(
          onPressed: () => Get.to(() => CartPage()),
          backgroundColor: Colors.black,
          child: Badge(
              badgeContent: Text(
                value.cartItems.length.toString(),
                style: GoogleFonts.abel(
                    color: value.cartItems.length == 0
                        ? Colors.black
                        : Colors.white),
              ),
              position: BadgePosition.topEnd(
                top: value.cartItems.length == 0 ? -13 : -18,
                end: value.cartItems.length == 0 ? -13 : -18,
              ),
              badgeColor:
                  value.cartItems.length == 0 ? Colors.black : Colors.red,
              child: Icon(Icons.shopping_bag)),
        );
      })),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Good morning,",
                  style: GoogleFonts.notoSerif(color: Colors.grey[600])),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Let's order fresh items for you",
                  style: GoogleFonts.actor(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text("Fresh items",
                  style: GoogleFonts.notoSerif(color: Colors.grey[600])),
            ),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                      itemCount: value.shopItems.length,
                      padding: EdgeInsets.all(12.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4,
                      ),
                      itemBuilder: (context, index) {
                        return GroceryItemTile(
                            itemName: value.shopItems[index][0],
                            itemPrice: value.shopItems[index][1],
                            itemPath: value.shopItems[index][2],
                            color: value.shopItems[index][3],
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .addItemToCart(index);
                            });
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
