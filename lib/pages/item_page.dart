import 'package:aplikacja/models/Cart.dart';
import 'package:aplikacja/models/Product.dart';
import 'package:aplikacja/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class ItemPage extends StatelessWidget {
  final String productId;

 ItemPage ({Key?key, required this.productId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =Provider.of<ProductDataProvider>(context)
    .getElementByID(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title, style: GoogleFonts.marmelad(),)
      ),
      body: Container(
        child:ListView(
          children:<Widget> [
            Hero(
              tag: data.imgUrl,
              child:Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image: NetworkImage(data.imgUrl),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(horizontal: 35.0,vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children:<Widget> [
                    Text(data.title, style: TextStyle(fontSize: 26.0),),
                    Divider(),
                    Row(
                      children:<Widget> [
                        Text('Cena: ', style:TextStyle(fontSize: 24.0),),
                        Text('${data.price}', style:TextStyle(fontSize: 24.0),),
                      ],
                    ),
                    Divider(),
                    Text(data.description),

                    SizedBox(
                      height: 20.0,
                    ),

                    Provider.of<CartDataProvider>(context)
                        .cartItems
                        .containsKey(productId)
                    ?Column(
                      children:<Widget> [
                        MaterialButton(
                          color: Color(0xFFCCFF90),
                          child: Text('Przejść do koszyka'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartPage(),
                            ));
                          },
                        ),
                        Text(
                          'Product dodany do koszyka',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                          ),
                        )
                      ],
                    )
                        : MaterialButton(
                        color: Theme.of(context).primaryColor,
                      child: Text('Dodac do koszyka'),
                      onPressed: () {
                        Provider.of<CartDataProvider>(context, listen: false)
                            .addItem(
                          productId: data.id,
                          imgUrl: data.imgUrl,
                          title: data.title,
                          price: data.price,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
