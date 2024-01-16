import '../models/Cart.dart';
import '../widgets/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    //final cartData = Provider.of<CartDataProvider>(context);
    final cartData = context.watch<CartDataProvider>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Kosz szczęścia: '),
        ),
        body: cartData.cartItems.isEmpty
            ? Card(
          elevation: 5.0,
          margin: const EdgeInsets.all(30.0),
          child: Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text('Kosz jest pusty ;(',),
          ),
        )
            : Column(
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            Divider(),
            Row(
              children: <Widget>[
                Text(
                  'Cena: ' + cartData.totalAmount.toStringAsFixed(2),
                ),
                MaterialButton(
                  onPressed: () {
                    cartData.clear();
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text('Kupić'),
                ),
              ],
            ),
            Divider(),

            Expanded(child: CartItemList(cartData: cartData)),

          ],
        )
    );
  }
}