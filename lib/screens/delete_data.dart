import 'package:dio_networking/api.dart';
import 'package:flutter/material.dart';

class PutPage extends StatefulWidget {
  static const String id = 'DeletePage';
  const PutPage({Key? key}) : super(key: key);

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  final id = TextEditingController();
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('POST')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: id,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  _client.deleteUser(id: id.text);
                },
                child: const Text('Delete User'))
          ],
        ),
      ),
    );
  }
}
