import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/login.dart';
import 'pages/mainpanel.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Dairy Admin Panel",
      debugShowCheckedModeBanner: false,
      home: LoginPage(
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name:"/",page:() =>LoginPage()),
        GetPage(name: "/adminclasses", page:()=> AdminClasses())
      ],
    );
  }
}
