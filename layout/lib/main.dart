import 'package:flutter/material.dart';
import 'package:layout/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // เรื่องใช้หลายหน้า ใช้ home
      debugShowCheckedModeBanner: false, // เอา debug ออก
      title: "Pet History",
      home: HomePage(),
    );
  }
}