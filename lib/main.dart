import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_flutter/Model/detailsModal.dart';
import 'package:test_flutter/apicall.dart';

import 'Utility/utility.dart';
import 'page_loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(title: 'Home'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required String title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Data>> getUser() async {
    List<Data> userData = [];
    final ApiCall httpService = ApiCall();
    final response =
        await httpService.getMethod("https://gorest.co.in/public-api/users");
    if (response.toString().isNotEmpty) {
      var data = json.decode(response.toString());
      DetailModal modal = DetailModal.fromJson(data);
      userData = modal.data!;
      print(" Final $response");
    }
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        child: FutureBuilder<List<Data>>(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            } else if (snapshot.hasError) {
              return Container();
            } else {
              List<Data> userdata = snapshot.data!;
              return _buildusers(context, userdata);
            }
          },
        ),
      ),
    );
  }

  // build list view & its tile
  ListView _buildusers(BuildContext context, List<Data> users) {
    return ListView.builder(
      itemCount: users.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        print(users[index].name);
        return Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                users[index].name.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(users[index].id.toString()),
              Text(
                users[index].email.toString(),
              ),
              Text(users[index].gender.toString()),
              Text(users[index].status.toString()),
            ],
          ),
        );
      },
    );
  }
}
