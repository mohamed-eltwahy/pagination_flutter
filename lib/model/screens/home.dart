import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_list_pagination/provider/homeprovider.dart';
import 'package:provider/provider.dart';
import '../passenger_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

   Provider.of<HomeProvider>(context, listen: false).getalldata();

    // print('ddddddddddddddddddd' + Provider.of<HomeProvider>(context, listen: false).getalldata().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite List Pagination"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container();
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: 12,
      ),
    );
  }
}
