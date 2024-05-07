import 'dart:convert';
// import 'dart:io';

import 'package:chart_sazmany/container_class.dart';
import 'package:chart_sazmany/data.dart';
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
  List<String> parent_id_list = [];
  List<String> parent_id_list_two = [];
  int arrayindex = 0;
  int arrayindexbasick = 0;
  late int list_child;

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
                  List json = await jsonDecode(response);
                  var model = json_model_class.fromJson(json[0]);
                  print(
                      'jsonmodel : ${model.entity?.title} , ${model.description}   ,   ${model.parentId} , ${model.subtitle}  , ${model.uuid}');
                  data_testing = json;
                  mmd = data_testing;
                  // readJson();
                  for (int x = 0; x < data_testing.length; x++) {
                    mmd = data_testing[x];
                    print(x);
                    print(
                        'description :${mmd['description']} , subtitle :${mmd['subtitle']} , title :${mmd['entity']['title']} , uuid :${mmd['uuid']} , parent_id :${mmd['parent_id']} ');
                    if (data_testing[x]['parent_id'] == null) {
                      print(
                          ' parent information  description :${data_testing[x]['description']} , subtitle :${data_testing[x]['subtitle']} , title :${data_testing[x]['entity']['title']} , uuid :${data_testing[x]['uuid']} , parent_id :${data_testing[x]['parent_id']} ');
                      String id_parent = data_testing[x]['uuid'];
                      List<String> myList = [];
                      myList.add(id_parent);
                      List? listtwo = [];

                      recursive_function(myList, data_testing, listtwo);

                      // for (int x = 0; x < data_testing.length; x++) {
                      //   if (id_parent == data_testing[x]['parent_id']) {
                      //     print(
                      //         ' childern parentid  description :${data_testing[x]['description']} , subtitle :${data_testing[x]['subtitle']} , title :${data_testing[x]['entity']['title']} , uuid :${data_testing[x]['uuid']} , parent_id :${data_testing[x]['parent_id']} ');

                      //     parent_id_list.add(data_testing[x]['uuid']);
                      //     // parent_id_list[0].isEmpty
                      //     //     ? parent_id_list.add(data_testing[x]['uuid'])
                      //     //     : null;
                      //   }
                      // }
                    }
                  }
                  // print('j0${parent_id_list[0]}');
                  // print('j1${parent_id_list[1]}');
                  // print('length array${parent_id_list.length}');
                  // print('index array${arrayindex}');
//                   for (int y = 0; y <= data_testing.length; y++) {
//                     list_child = arrayindex;
//                     if (arrayindex <= parent_id_list.length) {
//                       print('object');
//                       if (parent_id_list.length > arrayindex &&
//                           parent_id_list[arrayindex] ==
//                               data_testing[y]['parent_id']) {
//                         print(
//                             'list child:${list_child},very child: ${data_testing[y]['description']} , subtitle :${data_testing[y]['subtitle']} , title :${data_testing[y]['entity']['title']} , uuid :${data_testing[y]['uuid']} , parent_id :${data_testing[y]['parent_id']} ');
//                         parent_id_list_two.add(data_testing[y]['uuid']);
//                       }
//                       print('done if if (parent_id_list[arrayindex');
//                       if (y >= data_testing.length - 1) {
//                         print('in if (y >= data_testing.length)');
//                         arrayindex++;
//                         print('parent_id_list_two${parent_id_list_two}');
// //                         if (parent_id_list_two.isNotEmpty) {

// // parent_id_list=parent_id_list_two;
// // arrayindex=0;
// //                         }else{ y=y+64; }
//                         y = 0;
//                       }
//                     }
//                   }
                  // print('object   ${parent_id_list[0]}');
                },
                child: Text('show data in console')),
          ],
        ),
      ),
    ));
  }
}

List recursive_function(
    List<dynamic> listUuid, List data_testing, List listtwo) {
      if(listUuid.isEmpty&&listtwo.isEmpty){
        return [];
      }
  print('list uuid $listUuid');
  int x = listUuid.length - 1;
  // int valuejson = 0 ;
  print('com to function$x');
  for (int valuejson = 0; valuejson < data_testing.length; valuejson++) {
    print(' number of search in data ${listUuid[x]}');
    if (listUuid[x] == data_testing[valuejson]['parent_id']) {
      // print('listUuid[x]${listUuid[x]}');
      print('this uuid function${data_testing[valuejson]['uuid']}');
      String data = data_testing[valuejson]['uuid'].toString();
      print('not null$data');
      listtwo.add(data);
      print('it null');
      print('list uuid ${listUuid.length}');
    }
  }

  if (listUuid.length - 1 <= 0) {
    print('com to fiest if ');
    listUuid = List.of(listtwo);
    print('uuidlist$listUuid');
    listtwo =[];
    return recursive_function(listUuid, data_testing, listtwo);
  } else {
    print('tree');
    print('final list childern :$listtwo');
    listUuid.removeAt(listUuid.length - 1);
    return recursive_function(listUuid, data_testing, listtwo);
  }
  // return listUuid;
}
