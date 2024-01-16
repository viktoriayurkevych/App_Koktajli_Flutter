import 'dart:collection';

import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final  color;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imgUrl,
    required this.color,
  });
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p3',
      title: 'Żółta eksplozja szczęścia',
      description: 'Naprawdę ci się spodoba, kiedy spróbujesz',
      price: 35.50,
      imgUrl:
      'https://th.bing.com/th/id/OIP.kHOLCf4OSe-ePjjNgNIf5QHaHG?w=140&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p1',
      title: 'Wiosenne przebudzenie',
      description: 'Naprawdę ci się spodoba, kiedy spróbujesz',
      price: 40.99,
      imgUrl:
      'https://th.bing.com/th/id/OIP.dUWw3uDUWcjSH4kQ4pyKjgHaKg?w=125&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',
      color: '0xFFBBDEFB',
    ),
    Product(
      id: 'p2',
      title: 'Letnia swoboda',
      description: 'Naprawdę ci się spodoba, kiedy spróbujesz',
      price: 79.99,
      imgUrl:
      'https://th.bing.com/th/id/OIP.UrA41mjXuFZ61OoUPPwKKAHaLH?w=121&h=182&c=7&r=0&o=5&dpr=1.5&pid=1.7',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p4',
      title: 'Zielone smoothie',
      description: 'Naprawdę ci się spodoba, kiedy spróbujesz',
      price: 35.99,
      imgUrl:
      'https://th.bing.com/th/id/OIP.jso5XtGirUgwEXCJ_XQCYQHaI-?w=138&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',
      color: '0xFFCCFF90',
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);
  Product getElementByID(String id)
  => _items.singleWhere((value) => value.id == id);
}

