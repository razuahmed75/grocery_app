import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/cart_model.dart';
import 'package:myapp/others/back_button.dart';
import 'package:provider/provider.dart';
import '../stripe_payment/payment_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    final paymentcontroller = Get.put(PaymentController());
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
            Consumer<CartModel>(builder: ((context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(38.0),
                child: Container(
                  padding: EdgeInsets.all(24),
                  width: 400,
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total amount",
                            style: GoogleFonts.robotoMono(
                                color: Colors.green[100]),
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
                        onPressed: () {
                          paymentcontroller.makePayment(
                              amount: '20', currency: 'USD');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pay Now",
                              style: GoogleFonts.robotoMono(
                                  color: Colors.green[100]),
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
            })),
          ],
        );
      })),
    ));
  }
}
