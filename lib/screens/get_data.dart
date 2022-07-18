import 'package:dio_networking/api.dart';
import 'package:flutter/material.dart';

import '../model/data.dart';
import '../model/user.dart';

class GetDataPage extends StatefulWidget {
  static const String id = 'GetDataPage';
  const GetDataPage({Key? key}) : super(key: key);

  @override
  State<GetDataPage> createState() => _GetDataPageState();
}

class _GetDataPageState extends State<GetDataPage> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GET'),
        ),
        body: Center(
          child: FutureBuilder<User?>(
            future: _client.getUser('1'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                User? userInfo = snapshot.data;
                if (userInfo != null) {
                  Data userData = userInfo.data;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(userData.avatar),
                      const SizedBox(height: 8.0),
                      Text(
                        '${userInfo.data.firstname} ${userInfo.data.lastname}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        userData.email,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  );
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
