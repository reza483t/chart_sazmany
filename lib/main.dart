import 'dart:convert';
import 'dart:io';

import 'package:chart_sazmany/container_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List data_testing;
  var mmd;

  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('assets/data.json');
  //   final data = await json.decode(response).toString();
  //   data_testing = await jsonDecode(response);
  //   mmd = data_testing;
  // print('list data this is : $data_testing');
  // print('first data in my list : ${data_testing[0]}');
  // print('data is string : $data');
  // for(int x = 0 ; x < 4; x++) {
  //   print(data_testing[x]);
  //   print('$x human');
  // }
  // for (int x = 0; x < data_testing.length; x++) {
  //   print(x);
  //    mmd = data_testing[x];
  //   print('description :${mmd['description']}');
  //   print('subtitle :${mmd['subtitle']}');
  //   print('title :${mmd['entity']['title']}');
  //   print('uuid :${mmd['uuid']}');
  //   print('parent_id :${mmd['parent_id']}');
  // }
  // return mmd;
  // ListView.separated(
  //   itemBuilder: (context, index) {
  //     var json = data_testing[index];
  //     print('human${data_testing[index]}');
  //     print('description:${json['description']}');
  //     print('subtitle:${json['subtitle']}');
  //     print('title:${json['title']}');
  //     return My_Container(
  //         description: json['description'],
  //         subtitle: json['subtitle'],
  //         title: json['title']);
  //   },
  //   separatorBuilder: (context, index) {
  //     return SizedBox(
  //       width: 5,
  //       height: 10,
  //     );
  //   },
  //   itemCount: data_testing.length,
  //   scrollDirection: Axis.vertical,
  // );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          children: [
            My_Container(
              description: 'مشاور',
              subtitle: 'مشاور قنی',
              title: 'حسین تقی زاده',
            ),
            ElevatedButton(
                onPressed: () async {
                  final String response =
                      await rootBundle.loadString('assets/data.json');
                  data_testing = await jsonDecode(response);
                  mmd = data_testing;
                  // readJson();
                  for (int x = 0; x < data_testing.length; x++) {
                    mmd = data_testing[x];
                    print(x);
                    print('description :${mmd['description']}');
                    print('subtitle :${mmd['subtitle']}');
                    print('title :${mmd['entity']['title']}');
                    print('uuid :${mmd['uuid']}');
                    print('parent_id :${mmd['parent_id']}');
                  }
                },
                child: Text('show data in console')),
          ],
        ),
      ),
    ));
  }
}
