import 'dart:convert';

import 'package:api_call/model/address.dart';
import 'package:api_call/model/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as api;

class UserApi extends StatefulWidget {
  const UserApi({Key? key}) : super(key: key);

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  //String data = "";
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataFetchFromServer();
  }

  DataFetchFromServer() async {
    final endpoint = "https://jsonplaceholder.typicode.com/users";
    final Uri url = Uri.parse(endpoint);
    try {
      final response = await api.get(url);
      print(response.body);
      print(response.statusCode);
      final List decodedBody = json.decode(response.body);
      // user = decodedBody;
      users = decodedBody
          .map<User>((listItem) => User.convertToUser(listItem))
          .toList();
      setState(() {});
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Api"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Id:-"
                  "${index + 1}. ${user.userinfo.name}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(user.userinfo.username),
                Text(user.userinfo.email),
                Text(user.address.city),
                Text(
                  "Street:- "
                  "${user.address.street}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Email:- "
                  "${user.address.suite}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Email:- "
                  "${user.address.city}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Email:- "
                  "${user.address.geo.laltitude}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Email:- "
                  "${user.address.geo.longitude}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Company Name:- "
                  "${user.company.name}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "CatchPhrase:- "
                  "${user.company.catchPhrase}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "bs:- "
                  "${user.company.bs}",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
