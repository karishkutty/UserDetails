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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(" User "),
      ),
      body: _buildBody(context),
    );
  }

  // build list view & manage states
  FutureBuilder<List<Data>> _buildBody(BuildContext context) {
    final ApiCall httpService = ApiCall();
    return FutureBuilder<List<Data>>(
      // future: httpService.getMethod(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Data>? users = snapshot.data;
          print(users);
          return _buildusers(context, users!);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
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
          child: ListTile(
            title: Text(
              "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(users[index].name.toString()),
          ),
        );
      },
    );
  }
}
