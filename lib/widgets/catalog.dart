import 'package:aplikacja/pages/catalog_page.dart';
import 'package:flutter/material.dart';
class CatalogListTitle extends StatelessWidget {
  final imgUrl;

  CatalogListTitle({Key?key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemCatalog(imgUrl: imgUrl,),
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text('Letni zestaw orzeżwiający'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('09:00 - 00:00'),
                Row(
                  children: <Widget>[
                    Icon(Icons.star, size: 15, color: Colors.amberAccent,),
                    Text('4,9'),
                  ],
                )

              ],
            ),
          ),
        )
    );
  }
}
