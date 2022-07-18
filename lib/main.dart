import 'package:dio_networking/screens/get_data.dart';
import 'package:dio_networking/screens/post_data.dart';
import 'package:dio_networking/screens/put_data.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        GetDataPage.id: (context) => const GetDataPage(),
        PostPage.id: (context) => const PostPage(),
        PutPage.id: (context) => const PutPage()
      },
    );
  }
}
