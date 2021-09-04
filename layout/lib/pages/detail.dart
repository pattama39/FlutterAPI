import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final v1, v2, v3, v4; // ข้อมูลที่จะส่งเข้ามา
  DetailPage(this.v1, this.v2, this.v3, this.v4); // กำหนดว่ามีส่งอะไรบ้าง

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    // TODO: implement initState --> ดึงข้อมูลมาแสดง
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_v1),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // Text(_v1,style: TextStyle(fontSize: 30),),
            // Text(_v2,style: TextStyle(fontSize: 25, color: Colors.grey),),
            Image.network(_v3),
            Text(_v4)
          ],
        ),
      ),     
    );
  }
}