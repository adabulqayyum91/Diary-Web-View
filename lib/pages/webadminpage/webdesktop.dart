import 'package:dairyadmin/controllers/adminDrawercontroller.dart';
import 'package:dairyadmin/res/customfonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'customdrawerdata.dart';
import 'desktoptables/customstudenttable.dart';
import 'desktoptables/customsubjecttable.dart';
import 'desktoptables/customtableclasses.dart';
import 'desktoptables/customteachertables.dart';


class WebAdminClasses extends StatelessWidget {
  WebAdminClasses({this.constraints});
  BoxConstraints constraints;
  AdminDrawerController adminDrawerController =
  Get.put(AdminDrawerController());
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Color(0xFF253274),
            child: Padding(
              padding: EdgeInsets.only(
                top: constraints.minHeight * 0.03,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: constraints.minWidth * 0.02),
                    child: Row(
                      children: [
                        Text(
                          "School Dairy",
                          style: TextStyle(
                              fontFamily: roboto,
                              fontWeight: FontWeight.bold,
                              fontSize: constraints.maxWidth * 0.02,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      padding:
                      EdgeInsets.only(top: constraints.minWidth * 0.03),
                      itemCount: drawData().length,
                      itemBuilder: (context, int index) {
                        var mydata = drawData()[index];
                        return Obx(
                              () => GestureDetector(
                            onTap: () {
                              adminDrawerController.currentdrawer.value = index;
                            },
                            child: Container(
                              height: constraints.minHeight * 0.08,
                              color:
                              adminDrawerController.currentdrawer.value ==
                                  index
                                  ? Color(0xFFD7D5D5)
                                  : Color(0xFF253274),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: constraints.minWidth * 0.02),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      mydata.image,
                                      height: constraints.minHeight * 0.05,
                                      color: adminDrawerController
                                          .currentdrawer.value ==
                                          index
                                          ? Color(0xFF253274)
                                          : Color(0xFFD7D5D5),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      mydata.name,
                                      style: TextStyle(
                                          fontSize: constraints.minWidth * 0.01,
                                          color: adminDrawerController
                                              .currentdrawer.value ==
                                              index
                                              ? Color(0xFF253274)
                                              : Color(0xFFD7D5D5)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(right: 20),
                  color: Color(0xFFCED0D6).withOpacity(0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        "assets/images/profile.svg",
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      PopupMenuButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFF000000),
                          ),
                          onSelected: (items) {
                            switch (items) {
                              case 0:
                                changepassworddialog(context);
                                break;
                              case 1:
                                logoutdialog(context);
                                break;
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                value: 0, child: Row(
                              children: [
                                SvgPicture.asset("assets/images/key.svg"),
                                SizedBox(width: 10,),
                                Text("Change Password",style: TextStyle(fontSize: constraints.minWidth*0.0075),),
                              ],
                            )),


                            PopupMenuItem(value: 1, child: Row(
                              children: [
                                SvgPicture.asset("assets/images/onoff.svg"),
                                SizedBox(width: 10,),
                                Text("Log Out",style: TextStyle(fontSize: constraints.minWidth*0.0075)),
                              ],
                            ))
                          ])
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: constraints.minHeight * 0.05,
                        bottom: constraints.minHeight * 0.05),
                    child:Obx(()=> adminDrawerController.currentdrawer.value == 0 ?CustomTableClasses(constraints: constraints,):
                    adminDrawerController.currentdrawer.value == 1?CustomTeacherTable(constraints: constraints,):
                    adminDrawerController.currentdrawer.value == 2?CustomStudentTable(constraints: constraints,):CustomTableSubject(constraints:constraints))
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();

  void changepassworddialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: Container(
                height: constraints.minHeight * 0.75,
                width: constraints.minWidth * 0.4,
                color: Colors.white,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        /*top: widget.constraints.minHeight*0.07,*/ left:
                      constraints.minWidth * 0.015,
                        right: constraints.minWidth * 0.015,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Change Password",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: constraints.minWidth * 0.02,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Current Password",
                                          style: TextStyle(
                                              fontSize:
                                              constraints.minWidth * 0.013,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: roboto,
                                              color: Color(0xFF000000)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText:
                                              "Enter Current Password",
                                              hintStyle: TextStyle(
                                                  color: Color(0xFF000000)
                                                      .withOpacity(0.4)),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black12,
                                                      width: 1)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black12,
                                                      width: 1))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "New Password",
                                          style: TextStyle(
                                              fontSize:
                                              constraints.minWidth * 0.013,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: roboto,
                                              color: Color(0xFF000000)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Enter New Password",
                                              hintStyle: TextStyle(
                                                  color: Color(0xFF000000)
                                                      .withOpacity(0.4)),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black12,
                                                      width: 1)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black12,
                                                      width: 1))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Confirm New Password",
                                          style: TextStyle(
                                              fontSize:
                                              constraints.minWidth * 0.013,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: roboto,
                                              color: Color(0xFF000000)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Confirm New Password",
                                              hintStyle: TextStyle(
                                                  color: Color(0xFF000000)
                                                      .withOpacity(0.4)),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black12,
                                                      width: 1)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black12,
                                                      width: 1))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(flex: 4,child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                              Container(height: constraints.minHeight*0.07,
                                width: constraints.minWidth*0.12,
                                child: ElevatedButton(onPressed: (){
                                  Navigator.pop(context);

                                },style: ElevatedButton.styleFrom(primary: Color(0xFF8E8E8D)),child: Center(
                                  child: Text("Cancel",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: constraints.minWidth*0.012,fontFamily: roboto),),
                                )),
                              ),
                              SizedBox(width: 10,),
                              Container(height: constraints.minHeight*0.07,
                                width: constraints.minWidth*0.12,
                                child: ElevatedButton(onPressed: (){

                                },style: ElevatedButton.styleFrom(primary: Color(0xFF7189FF)),child: Center(
                                  child: Text("Update",style: TextStyle(color: Color(0xFFFFFFFF),fontSize: constraints.minWidth*0.012,fontFamily: roboto),),
                                )),
                              ),
                            ],)),

                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, right: 10),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              size: constraints.minWidth * 0.015,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  logoutdialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Color(0xFF000000).withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4))
                ]),
                height: constraints.minHeight * 0.3,
                width: constraints.minWidth * 0.3,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(
                            "Are you Sure?",
                            style: TextStyle(
                                fontFamily: roboto,
                                fontSize: constraints.minWidth * 0.015,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: constraints.minHeight * 0.07,
                            width: constraints.minWidth * 0.12,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF8E8E8D)),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize:
                                        constraints.minWidth * 0.012,
                                        fontFamily: roboto),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: constraints.minHeight * 0.07,
                            width: constraints.minWidth * 0.12,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.offNamed("/");
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF7189FF)),
                                child: Center(
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize:
                                        constraints.minWidth * 0.012,
                                        fontFamily: roboto),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}