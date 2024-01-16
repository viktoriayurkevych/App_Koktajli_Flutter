import 'package:aplikacja/models/Product.dart';
import 'package:aplikacja/widgets/bottom_bar.dart';
import 'package:aplikacja/widgets/catalog.dart';
import 'package:aplikacja/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);
    return  Scaffold(
      backgroundColor: Colors.amberAccent,
    body: SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height -85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )
        ),
        child: ListView(
          padding: const EdgeInsets.all(10.0),
        children:<Widget>[
          Container(
              child: ListTile(
                title:Text('Orzeżwiające napoje',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                subtitle: Text('Ponad 100 rodzajów napojów',
                style: TextStyle(fontSize: 16,)
                ),
                trailing: Icon(Icons.panorama_horizontal),
                )
              ),
            Container(
              padding: const EdgeInsets.all(5.0),
              height: 290,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productData.items.length,
                itemBuilder: (context, int index) =>
                    ChangeNotifierProvider.value(
                      child: ItemCard(),
                      value: productData.items[index],
                    )
              ),
            ),
            Padding(padding: const EdgeInsets.all(10.0),
              child:Text('Katalog koktajli',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ...productData.items.map((value){
            return CatalogListTitle(imgUrl:value.imgUrl);
          }).toList(),

            ],
           )
         ),
      ),
      // !- BOTTOM BAR
      bottomNavigationBar: BottomBar(),
    );
  }
}
