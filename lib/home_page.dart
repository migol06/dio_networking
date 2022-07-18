import 'package:dio_networking/screens/get_data.dart';
import 'package:dio_networking/screens/post_data.dart';
import 'package:dio_networking/screens/put_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dio Networking')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (() => Navigator.pushNamed(context, GetDataPage.id)),
                child: const Text('GET')),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
                onPressed: (() {
                  Navigator.pushNamed(context, PostPage.id);
                }),
                child: const Text('POST')),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
                onPressed: (() {
                  Navigator.pushNamed(context, PutPage.id);
                }),
                child: const Text('PUT')),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(onPressed: (() {}), child: const Text('DELETE')),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(onPressed: (() {}), child: const Text('FORM DATA')),
          ],
        ),
      ),
    );
  }
}
