import 'package:aplikacja/models/Cart.dart';
import 'package:aplikacja/models/Product.dart';
import 'package:aplikacja/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductDataProvider>(
    create: (context) => ProductDataProvider(),
    ),
          ChangeNotifierProvider<CartDataProvider>(
    create: (context) => CartDataProvider(),
    ),
        ],
    child:MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.marmeladTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
      ),
    );
  }
}



