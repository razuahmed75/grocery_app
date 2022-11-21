import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/cart_model.dart';
import 'package:myapp/others/back_button.dart';
import 'package:myapp/others/payNow_section.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<CartModel>(builder: ((context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            popButton,
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text("My cart",
                  style: GoogleFonts.robotoMono(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: value.cartItems[index][3][100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            value.cartItems[index][2],
                            height: 36,
                          ),
                          title: Text(
                            value.cartItems[index][0],
                            style: GoogleFonts.robotoMono(),
                          ),
                          subtitle: Text(
                            '\$' + value.cartItems[index][1],
                            style: GoogleFonts.robotoMono(),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index);
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: value.cartItems[index][3][900],
                              )),
                        ),
                      ),
                    );
                  })),
            ),
            PayNow.payNow_section,
          ],
        );
      })),
    ));
  }
}
