import 'package:flutter/material.dart';
import 'package:graphql_prueba/src/home/ui/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grapqhl App',
      home: HomePage()
    );
  }
}