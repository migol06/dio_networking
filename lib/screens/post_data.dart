import 'package:dio_networking/api.dart';
import 'package:dio_networking/model/user_info.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  static const String id = 'Postpage';
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final name = TextEditingController();
  final job = TextEditingController();
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
            ElevatedButton(
                onPressed: () async {
                  UserInfo userInfo = UserInfo(
                      name: name.text,
                      job: job.text,
                      createdAt: '2022-07-18T07:00:08.175',
                      id: '10000');
                  print(userInfo.name + userInfo.job);

                  UserInfo? retrieveUser =
                      await _client.createUser(userInfo: userInfo);

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
                child: const Text('Create User'))
          ],
        ),
      ),
    );
  }
}
