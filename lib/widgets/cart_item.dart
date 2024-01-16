import 'package:aplikacja/models/Cart.dart';
import 'package:aplikacja/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartItem extends StatelessWidget {
  final cartDate;
  final index;
  const CartItem({Key?key,
  this.cartDate,
    this.index})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading:InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder:(context) => ItemPage(
                    productId: cartDate.cartItems.keys.tolist()[index],
                ),),
            );
          },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(cartDate.cartItems.values.toList()[index].imgUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ),
        title: Text(cartDate.cartItems.values.toList()[index].title),
        subtitle: Text('Cena: ${cartDate.cartItems.values.toList()[index].price}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children:<Widget> [
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false)
                    .updateItemsSubOne(cartDate.cartItems.keys.toList()[index]);
              }
            ),
            Text('x${cartDate.cartItems.values.toList()[index].number}'),
            IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  Provider.of<CartDataProvider>(context, listen: false)
                      .updateItemsAddOne(cartDate.cartItems.keys.toList()[index]);
                }
            ),
          ],
        ),
      ),
    );
  }
}
