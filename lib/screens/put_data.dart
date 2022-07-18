import 'package:dio_networking/api.dart';
import 'package:dio_networking/model/user_info.dart';
import 'package:flutter/material.dart';

class PutPage extends StatefulWidget {
  static const String id = 'PutPage';
  const PutPage({Key? key}) : super(key: key);

  @override
  State<PutPage> createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  final name = TextEditingController();
  final job = TextEditingController();
  final id = TextEditingController();
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PUT')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            TextFormField(
              controller: job,
              decoration: const InputDecoration(
                labelText: 'Job',
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            TextFormField(
              controller: id,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  UserInfo? retrieveUser = await _client.updateUser(
                      userInfo: UserInfo(name: name.text, job: job.text),
                      id: id.text);

                  print(retrieveUser);

                  if (retrieveUser != null) {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('ID: ${retrieveUser.id}'),
                                        Text('ID: ${retrieveUser.name}'),
                                        Text('ID: ${retrieveUser.job}'),
                                        Text('ID: ${retrieveUser.createdAt}')
                                      ],
                                    )),
                              ),
                            ));
                  }
                },
                child: const Text('Update Info'))
          ],
        ),
      ),
    );
  }
}
