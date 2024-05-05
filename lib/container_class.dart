import 'package:flutter/material.dart';

class My_Container extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  const My_Container(
      {required this.description,
      required this.subtitle,
      required this.title,
      super.key});

  @override
  State<My_Container> createState() => _My_ContainerState();
}

class _My_ContainerState extends State<My_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20), // شعاع گوشه‌ها برابر با 20
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(20))),
              width: 150,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.title),
                  Text(
                    widget.subtitle,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20))),
                  width: 50,
                  height: 60,
                  child: Icon(
                    Icons.person_pin,
                    size: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              color: Colors.blue.shade300,
              width: 200,
              height: 25,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.description,
                      style: TextStyle(fontSize: 10),
                    )
                  ]),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
          ),
          width: 200,
          height: 15,
        )
      ]),
    );
  }
}
