import 'package:flutter/material.dart';
import 'package:product_6/details_page.dart';
import 'package:product_6/search.dart';
import 'package:product_6/trivia.dart';
import 'package:product_6/update_page.dart';
import 'home_page.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => const HomePage(),
        // '/details_page': (BuildContext context) => const DetailsPage(productObject: ,),
        '/update_page': (BuildContext context) => const UpdatePage(),
        '/search_page': (BuildContext context) => const SearchPage(),
        '/trivia' : (BuildContext context) => const TriviaPage(),
      },
    );
  }
}
