import 'dart:async';

import 'package:dairyadmin/Widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class WebLogin extends StatelessWidget {
  WebLogin({this.constraints});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  BoxConstraints constraints;
  final _formKey = GlobalKey<FormState>();
  String emailpass = "1234";
  String email = "hello";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: constraints.minHeight * 0.15),
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color(0xFF7189FF).withOpacity(0.6), width: 3)),
              height: constraints.minHeight * 0.65,
              width: constraints.minWidth * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container( height: constraints.minHeight * 0.08,
                          width: constraints.minWidth * 0.35,
                          child: SvgPicture.asset(
                            "assets/images/logo.svg",

                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: constraints.minWidth * 0.03,
                          right: constraints.minWidth * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomTextfield(
                                  hint: "Email",
                                  ispassword: false,
                                  valid: "Please enter email",
                                  size: constraints,
                                  label: '',
                                  textEditingController: emailcontroller,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomTextfield(
                                  hint: "Password",
                                  size: constraints,
                                  valid: "Please enter password",
                                  ispassword: true,
                                  label: "",
                                  textEditingController: passwordcontroller,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState.validate()) {
                                        if (passwordcontroller.text ==
                                                emailpass &&
                                            emailcontroller.text == email) {
                                          Toast.show("Waiting", context,
                                              textColor: Colors.white,
                                              backgroundColor: Colors.green,
                                              duration: Toast.LENGTH_LONG,
                                              gravity: Toast.BOTTOM);
                                          Timer(Duration(seconds: 2), () {
                                            Get.toNamed("/adminclasses");
                                          });
                                        } else {
                                          Toast.show("Invalid Email", context,
                                              textColor: Colors.white,
                                              backgroundColor: Colors.red,
                                              duration: Toast.LENGTH_SHORT,
                                              gravity: Toast.BOTTOM);
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF7189FF),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          "Log in",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
