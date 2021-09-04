import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // โครงสร้างแอพ จะใช้ body
      appBar: AppBar(
        title: Text("ประวัติสัตว์เลี้ยง"),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // ใส่ระยะห่างจากขอบจอ
        child: FutureBuilder(
          builder: (context, snapshot) {
            var data = json.decode(snapshot.data.toString()); // คลาส json (ประกาศ import 'dart:convert' ด้วย) --> [{..., ..., ...}, {}, ..., {}]
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MyBox(data[index]['title'], data[index]['subtitle'], data[index]['image_url'], data[index]['detail']);
              },
              itemCount: data.length,
            );
          },
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'), // รอการประมวลข้อมูล
        ),
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String image_url, String detail) {
    var v1 = title;
    var v2 = subtitle;
    var v3 = image_url;
    var v4 = detail; 

    return Container( // ใส่ได้แค่ตัวเดียว
      margin: EdgeInsets.only(top: 20), // ระยะห่างภายนอก
      padding: EdgeInsets.all(20), // ระยะห่างภายใน
      //color: Colors.blue[50],
      height: 180,
      decoration: BoxDecoration(
        //color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20), // ขอบ
        image: DecorationImage(
          image: NetworkImage(image_url),
          fit: BoxFit.cover, // ให้รูปเต็ม box
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.50), BlendMode.darken) // ความเข้ม ความเบาของภาพพื้นหลัง
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3), // รหีสสี RGB 0-255 (0,0,0 --> สีดำ) | 0.3 --> ความโปร่ง
            offset: Offset(3, 3), // รัศมีเงากี่ px
            blurRadius: 3,
            spreadRadius: 0
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // แนวตั้ง start --> ชิดบน | end --> ชิดล่าง | canter --> ตรงกลาง | spaceEvenly --> เฉลี่ยพื้นที่เท่าๆกัน
        crossAxisAlignment: CrossAxisAlignment.start, // แนวนอน start --> ชิดซ้าย | end --> ชิดขวา | canter --> ตรงกลาง
        children: [
          Text(
            title, 
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold // ความหนาของตัวอักษร
            ),
          ),
          SizedBox(height: 10,),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20,),
          TextButton(
            onPressed: () {
              // print("Next Page >>>>");
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(v1,v2,v3,v4))); // ไปหน้าถัดไป
            }, 
            child: Text(
              "อ่านต่อ",
              style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            ),
          ),
        ],
      ),
    );
  } 
}