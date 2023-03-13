import 'package:dairyadmin/pages/loginpage/loginfieldsphone.dart';
import 'package:flutter/material.dart';


import 'loginpage/loginfieldsweb.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraint) {
      return Scaffold(
        backgroundColor: Color(0xFFE2E2E2),
        body: constraint.minWidth > 1030
            ? WebLogin(
                constraints: constraint,
              )
            : PhoneLogin(constraints: constraint,),
      );
    });
  }
}

