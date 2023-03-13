import 'package:dairyadmin/controllers/classescontroller.dart';
import 'package:dairyadmin/res/customfonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:toast/toast.dart';

class CustomTableClasses extends StatefulWidget {
  CustomTableClasses({this.constraints});
  BoxConstraints constraints;
  @override
  _CustomTableClassesState createState() => _CustomTableClassesState();
}

class _CustomTableClassesState extends State<CustomTableClasses> {
  ClassesTableController classescontroller = Get.put(ClassesTableController());

  final _formKey = GlobalKey<FormState>();

  TextEditingController classnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF4F7FC), borderRadius: BorderRadius.circular(5)),
      width: widget.constraints.minWidth * 0.7,
      height: widget.constraints.minHeight * 0.7,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: widget.constraints.minWidth * 0.02,
                              right: widget.constraints.minWidth * 0.1),
                          child: Container(
                            height: widget.constraints.minHeight * 0.05,
                            child: Center(
                              child: TextField(
                                style: TextStyle(
                                  fontSize:
                                  widget.constraints.minWidth * 0.0085,
                                  fontFamily: roboto,
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10),
                                    filled: true,
                                    suffixIcon: Icon(
                                      Icons.search,
                                      size:
                                      widget.constraints.minWidth * 0.015,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                    fillColor: Color(0xFFDAE1EC),
                                    hintText: "Search",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                      fontSize: widget.constraints.minWidth *
                                          0.0085,
                                      fontFamily: roboto,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5),
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (classescontroller.classeslist.length == 1) {
                                    editdialog(context);
                                  }else if(classescontroller.classeslist.length > 1){
                                    Toast.show("Please select only one item", context,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.black,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM);
                                  }else if(classescontroller.classeslist.length == 0 ){
                                    Toast.show("Please select one item", context,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.black,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM);
                                  }
                                },
                                child: SvgPicture.asset(
                                  "assets/images/edit.svg",
                                  height: widget.constraints.minHeight * 0.04,
                                  width: widget.constraints.minWidth * 0.04,
                                ),
                              ),
                              SizedBox(
                                width: widget.constraints.minWidth * 0.009,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (classescontroller.classeslist.length > 0) {
                                    deletedialog(context);
                                  }else{
                                    Toast.show("Please select one or more item", context,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.black,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM);
                                  }
                                },
                                child: SvgPicture.asset(
                                    "assets/images/delete.svg",
                                    height:
                                    widget.constraints.minHeight * 0.04,
                                    width:
                                    widget.constraints.minWidth * 0.04),
                              ),
                              SizedBox(
                                width: widget.constraints.minWidth * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {
                                  createinsertiondialog(context);
                                },
                                child: SvgPicture.asset(
                                    "assets/images/addclass.svg",
                                    height:
                                    widget.constraints.minHeight * 0.04,
                                    width:
                                    widget.constraints.minWidth * 0.04),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Color(0xFFFFFFFF),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: widget.constraints.minWidth * 0.02,
                              right: widget.constraints.minWidth * 0.09),
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Obx(()=>
                                    Checkbox(
                                        value: classescontroller.check.value,
                                        onChanged: (value) {
                                          classescontroller
                                              .checkboxchanging(value);
                                          for(int i = 0 ; i<classescontroller.classeslist.length;i++){
                                            classescontroller.classeslist.remove("Class $i");
                                          }
                                          if (classescontroller.check.value ==
                                              true) {
                                            for (int i = 0; i < 10; i++) {
                                              classescontroller
                                                  .checkindexes[i] = true;
                                              classescontroller.classeslist.add("Class $i");
                                              print(classescontroller.classeslist);
                                            }
                                          } else {
                                            for (int i = 0; i < 10; i++) {
                                              classescontroller
                                                  .checkindexes[i] = false;
                                              classescontroller.classeslist.remove("Class $i");
                                              print(classescontroller.classeslist);
                                            }
                                          }
                                        }),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "CLASS name",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF606F89),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: roboto,
                                      fontSize:
                                      widget.constraints.minWidth *
                                          0.009),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "Teachers",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color(0xFF606F89),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: roboto,
                                      fontSize:
                                      widget.constraints.minWidth *
                                          0.009),
                                ),
                              ),
                              SizedBox(
                                width: widget.constraints.minWidth * 0.02,
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "Courses",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color(0xFF606F89),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: roboto,
                                      fontSize:
                                      widget.constraints.minWidth *
                                          0.009),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 9,
                      child: Scrollbar(
                        isAlwaysShown: true,
                        showTrackOnHover: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (context, int index) {
                              classescontroller.checkindexes.add(false);
                              return Container(
                                color: index % 2 == 0
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFFF4F7FC),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: widget.constraints.minHeight *
                                          0.01,
                                      bottom: widget.constraints.minHeight *
                                          0.01,
                                      left: widget.constraints.minWidth *
                                          0.02,
                                      right: widget.constraints.minWidth *
                                          0.09),
                                  child: Row(
                                    children: [
                                      Transform.scale(
                                        scale: 0.7,
                                        child: Obx(
                                              ()=> Checkbox(
                                              value: classescontroller
                                                  .checkindexes[index],
                                              onChanged: (value) {
                                                classescontroller
                                                    .checkindexes[index] =
                                                    value;

                                                if(value == true){
                                                  classescontroller.classeslist.add("Class $index");
                                                  print(classescontroller.classeslist[index]);
                                                }else{
                                                  classescontroller.classeslist.remove("Class $index");
                                                  print(classescontroller.classeslist);
                                                }
                                                for(int i = 0 ;i<10;i++){
                                                  if(classescontroller.checkindexes[i] == true ){
                                                    classescontroller.check.value = true;
                                                  }else{
                                                    classescontroller.check.value = false;
                                                    break;
                                                  }
                                                }

                                              }),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Class $index",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: roboto,
                                              fontSize: widget.constraints
                                                  .minWidth *
                                                  0.007),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          "teacher 1,teacher 2,teacher 3,teacher 4,teacher 5,teacher 6,teacher 7,teacher 8,teacher 9,",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: roboto,
                                              fontSize: widget.constraints
                                                  .minWidth *
                                                  0.007),
                                        ),
                                      ),
                                      SizedBox(
                                        width: widget.constraints.minWidth *
                                            0.02,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          "English, Urdu, Maths, Islamiyat, Pak Studies, Social Science",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: roboto,
                                              fontSize: widget.constraints
                                                  .minWidth *
                                                  0.007),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        height: widget.constraints.minHeight * 0.045,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: widget.constraints.minWidth * 0.02),
                              child: Text(
                                "Page 1-10",
                                style: TextStyle(
                                    fontSize:
                                    widget.constraints.minWidth * 0.007,
                                    color: Color(0xFF606F89)),
                              ),
                            ),
                            SizedBox(
                              width: widget.constraints.minWidth * 0.04,
                            ),
                            Icon(
                              Icons.arrow_back_ios_rounded,
                              size: widget.constraints.minWidth * 0.009,
                              color: Color(0xFF606F89),
                            ),
                            SizedBox(
                              width: widget.constraints.minWidth * 0.02,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: widget.constraints.minWidth * 0.009,
                              color: Color(0xFF606F89),
                            ),
                            SizedBox(
                              width: widget.constraints.minWidth * 0.04,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }

  String teachervalue;
  editdialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: Container(
                height: widget.constraints.minHeight * 0.75,
                width: widget.constraints.minWidth * 0.4,
                color: Colors.white,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        /*top: widget.constraints.minHeight*0.07,*/ left:
                      widget.constraints.minWidth * 0.015,
                        right: widget.constraints.minWidth * 0.015,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Edit Class",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize:
                                        widget.constraints.minWidth * 0.02,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Class Name",
                                          style: TextStyle(
                                              fontSize:
                                              widget.constraints.minWidth *
                                                  0.013,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: roboto,
                                              color: Color(0xFF000000)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Enter class name",
                                              hintStyle: TextStyle(
                                                  fontSize: widget.constraints
                                                      .minWidth *
                                                      0.013,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: roboto,
                                                  color: Color(0xFF000000)
                                                      .withOpacity(0.3)),
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Teacher",
                                          style: TextStyle(
                                              fontSize:
                                              widget.constraints.minWidth *
                                                  0.013,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: roboto,
                                              color: Color(0xFF000000)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Obx(
                                              () => Container(
                                            padding: EdgeInsets.only(left: 5,right: 15),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 8,
                                                  child: classescontroller
                                                      .teacherlist
                                                      .isEmpty ==
                                                      true
                                                      ? Text("Select Teachers",
                                                      style: TextStyle(
                                                          fontSize: widget
                                                              .constraints
                                                              .minWidth *
                                                              0.013,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontFamily:
                                                          roboto,
                                                          color: Colors
                                                              .black
                                                              .withOpacity(
                                                              0.3)))
                                                      : Scrollbar(
                                                    isAlwaysShown: true,
                                                    child: GridView
                                                        .builder(
                                                        shrinkWrap:
                                                        true,
                                                        padding: EdgeInsets
                                                            .only(
                                                            top:
                                                            5),
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                            childAspectRatio:
                                                            3.5,
                                                            crossAxisCount:
                                                            4),
                                                        itemCount:
                                                        classescontroller
                                                            .teacherlist
                                                            .length,
                                                        itemBuilder:
                                                            (context,
                                                            int index) {
                                                          return Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(
                                                                    5),
                                                                border: Border.all(
                                                                    color: Color(0xFF000000).withOpacity(0.3),
                                                                    width: 1)),
                                                            child:
                                                            Stack(
                                                              children: [
                                                                Center(
                                                                  child:
                                                                  Text(
                                                                    "${classescontroller.teacherlist[index]}",
                                                                    style: TextStyle(fontSize: widget.constraints.minWidth * 0.01),
                                                                  ),
                                                                ),
                                                                Align(
                                                                    alignment: Alignment.topRight,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.only(top: 2, right: 2),
                                                                      child: InkWell(
                                                                        onTap: () {
                                                                          classescontroller.teacherlist.remove(classescontroller.teacherlist[index]);
                                                                          print(classescontroller.teacherlist);
                                                                        },
                                                                        child: Icon(
                                                                          Icons.close,
                                                                          color: Color(0xFF000000),
                                                                          size: widget.constraints.minWidth * 0.009,
                                                                        ),
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                                PopupMenuButton(
                                                    onSelected: (value) {
                                                      classescontroller
                                                          .addteachers(value);
                                                      print(classescontroller
                                                          .teacherlist);
                                                    },
                                                    itemBuilder: (builder) {
                                                      return List.generate(
                                                          20,
                                                              (index) =>
                                                              PopupMenuItem(
                                                                child: Text(
                                                                    "Teacher $index"),
                                                                value:
                                                                "Teacher $index",
                                                              ));
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color: Color(0xFF000000)
                                                          .withOpacity(0.3),
                                                      size: widget.constraints
                                                          .minWidth *
                                                          0.025,
                                                    ))
                                              ],
                                            ),
                                            height:
                                            widget.constraints.minHeight *
                                                0.087,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Subject",
                                          style: TextStyle(
                                              fontSize:
                                              widget.constraints.minWidth *
                                                  0.013,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: roboto,
                                              color: Color(0xFF000000)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Obx(
                                              () => Container(
                                            padding: EdgeInsets.only(left: 5,right: 15),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 8,
                                                  child: classescontroller
                                                      .subjectlist
                                                      .isEmpty ==
                                                      true
                                                      ? Text("Select Subjects",
                                                      style: TextStyle(
                                                          fontSize: widget
                                                              .constraints
                                                              .minWidth *
                                                              0.013,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontFamily:
                                                          roboto,
                                                          color: Colors
                                                              .black
                                                              .withOpacity(
                                                              0.3)))
                                                      : Scrollbar(
                                                    isAlwaysShown: true,
                                                    child: GridView
                                                        .builder(
                                                        shrinkWrap:
                                                        true,
                                                        padding: EdgeInsets
                                                            .only(
                                                            top:
                                                            5),
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                            childAspectRatio:
                                                            3.5,
                                                            crossAxisCount:
                                                            4),
                                                        itemCount:
                                                        classescontroller
                                                            .subjectlist
                                                            .length,
                                                        itemBuilder:
                                                            (context,
                                                            int index) {
                                                          return Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(
                                                                    5),
                                                                border: Border.all(
                                                                    color: Color(0xFF000000).withOpacity(0.3),
                                                                    width: 1)),
                                                            child:
                                                            Stack(
                                                              children: [
                                                                Center(
                                                                  child:
                                                                  Text(
                                                                    "${classescontroller.subjectlist[index]}",
                                                                    style: TextStyle(fontSize: widget.constraints.minWidth * 0.01),
                                                                  ),
                                                                ),
                                                                Align(
                                                                    alignment: Alignment.topRight,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.only(top: 2, right: 2),
                                                                      child: InkWell(
                                                                        onTap: () {
                                                                          classescontroller.subjectlist.remove(classescontroller.subjectlist[index]);
                                                                          print(classescontroller.subjectlist);
                                                                        },
                                                                        child: Icon(
                                                                          Icons.close,
                                                                          color: Color(0xFF000000),
                                                                          size: widget.constraints.minWidth * 0.009,
                                                                        ),
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                                PopupMenuButton(
                                                    onSelected: (value) {
                                                      classescontroller
                                                          .addsubjects(value);
                                                      print(classescontroller
                                                          .subjectlist);
                                                    },
                                                    itemBuilder: (builder) {
                                                      return List.generate(
                                                          20,
                                                              (index) =>
                                                              PopupMenuItem(
                                                                child: Text(
                                                                    "Subjects $index"),
                                                                value:
                                                                "Subject $index",
                                                              ));
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color: Color(0xFF000000)
                                                          .withOpacity(0.3),
                                                      size: widget.constraints
                                                          .minWidth *
                                                          0.025,
                                                    ))
                                              ],
                                            ),
                                            height:
                                            widget.constraints.minHeight *
                                                0.087,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height:
                                            widget.constraints.minHeight *
                                                0.07,
                                            width: widget.constraints.minWidth *
                                                0.12,
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
                                                        color:
                                                        Color(0xFFFFFFFF),
                                                        fontSize: widget
                                                            .constraints
                                                            .minWidth *
                                                            0.012,
                                                        fontFamily: roboto),
                                                  ),
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height:
                                            widget.constraints.minHeight *
                                                0.07,
                                            width: widget.constraints.minWidth *
                                                0.12,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    primary: Color(0xFF7189FF)),
                                                child: Center(
                                                  child: Text(
                                                    "Update",
                                                    style: TextStyle(
                                                        color:
                                                        Color(0xFFFFFFFF),
                                                        fontSize: widget
                                                            .constraints
                                                            .minWidth *
                                                            0.012,
                                                        fontFamily: roboto),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            )
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
                              size: widget.constraints.minWidth * 0.015,
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

  createinsertiondialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: Container(
                height: widget.constraints.minHeight * 0.75,
                width: widget.constraints.minWidth * 0.4,
                color: Colors.white,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        /*top: widget.constraints.minHeight*0.07,*/ left:
                      widget.constraints.minWidth * 0.015,
                        right: widget.constraints.minWidth * 0.015,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add Class",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize:
                                        widget.constraints.minWidth * 0.02,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Class Name",
                                          style: TextStyle(
                                              fontSize:
                                              widget.constraints.minWidth *
                                                  0.013,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: roboto,
                                              color: Color(0xFF000000)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Enter class name",
                                              hintStyle: TextStyle(
                                                  fontSize: widget.constraints
                                                      .minWidth *
                                                      0.013,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: roboto,
                                                  color: Color(0xFF000000)
                                                      .withOpacity(0.3)),
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Teacher",
                                          style: TextStyle(
                                              fontSize:
                                              widget.constraints.minWidth *
                                                  0.013,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: roboto,
                                              color: Color(0xFF000000)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Obx(
                                              () => Container(
                                            padding: EdgeInsets.only(left: 5,right: 15),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 8,
                                                  child: classescontroller
                                                      .teacherlist
                                                      .isEmpty ==
                                                      true
                                                      ? Text("Select Teachers",
                                                      style: TextStyle(
                                                          fontSize: widget
                                                              .constraints
                                                              .minWidth *
                                                              0.013,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontFamily:
                                                          roboto,
                                                          color: Colors
                                                              .black
                                                              .withOpacity(
                                                              0.3)))
                                                      : Scrollbar(
                                                    isAlwaysShown: true,
                                                    child:
                                                    GridView.builder(
                                                        shrinkWrap:
                                                        true,
                                                        padding: EdgeInsets
                                                            .only(
                                                            top:
                                                            5),
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                            mainAxisSpacing:
                                                            2,
                                                            crossAxisSpacing:
                                                            1,
                                                            childAspectRatio:
                                                            3.5,
                                                            crossAxisCount:
                                                            4),
                                                        itemCount:
                                                        classescontroller
                                                            .teacherlist
                                                            .length,
                                                        itemBuilder:
                                                            (context,
                                                            int index) {
                                                          return Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(
                                                                    5),
                                                                border: Border.all(
                                                                    color: Color(0xFF000000).withOpacity(0.3),
                                                                    width: 1)),
                                                            child:
                                                            Stack(
                                                              children: [
                                                                Center(
                                                                  child:
                                                                  Text(
                                                                    "${classescontroller.teacherlist[index]}",
                                                                    style: TextStyle(fontSize: widget.constraints.minWidth * 0.01),
                                                                  ),
                                                                ),
                                                                Align(
                                                                    alignment: Alignment.topRight,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.only(top: 2, right: 2),
                                                                      child: InkWell(
                                                                        onTap: () {
                                                                          classescontroller.teacherlist.remove(classescontroller.teacherlist[index]);
                                                                          print(classescontroller.teacherlist);
                                                                        },
                                                                        child: Icon(
                                                                          Icons.close,
                                                                          color: Color(0xFF000000),
                                                                          size: widget.constraints.minWidth * 0.009,
                                                                        ),
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                                PopupMenuButton(
                                                    onSelected: (value) {
                                                      classescontroller
                                                          .addteachers(value);
                                                      print(classescontroller
                                                          .teacherlist);
                                                    },
                                                    itemBuilder: (builder) {
                                                      return List.generate(
                                                          20,
                                                              (index) =>
                                                              PopupMenuItem(
                                                                child: Text(
                                                                    "Teacher $index"),
                                                                value:
                                                                "Teacher $index",
                                                              ));
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color: Color(0xFF000000)
                                                          .withOpacity(0.3),
                                                      size: widget.constraints
                                                          .minWidth *
                                                          0.025,
                                                    ))
                                              ],
                                            ),
                                            height:
                                            widget.constraints.minHeight *
                                                0.087,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Subject",
                                          style: TextStyle(
                                              fontSize:
                                              widget.constraints.minWidth *
                                                  0.013,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: roboto,
                                              color: Color(0xFF000000)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Obx(
                                              () => Container(
                                            padding: EdgeInsets.only(left: 5,right: 15),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 8,
                                                  child: classescontroller
                                                      .subjectlist
                                                      .isEmpty ==
                                                      true
                                                      ? Text("Select Subjects",
                                                      style: TextStyle(
                                                          fontSize: widget
                                                              .constraints
                                                              .minWidth *
                                                              0.013,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontFamily:
                                                          roboto,
                                                          color: Colors
                                                              .black
                                                              .withOpacity(
                                                              0.3)))
                                                      : Scrollbar(
                                                    isAlwaysShown: true,
                                                    child: GridView
                                                        .builder(
                                                        shrinkWrap:
                                                        true,
                                                        padding: EdgeInsets
                                                            .only(
                                                            top:
                                                            5),
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                            childAspectRatio:
                                                            3.5,
                                                            crossAxisCount:
                                                            4),
                                                        itemCount:
                                                        classescontroller
                                                            .subjectlist
                                                            .length,
                                                        itemBuilder:
                                                            (context,
                                                            int index) {
                                                          return Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(
                                                                    5),
                                                                border: Border.all(
                                                                    color: Color(0xFF000000).withOpacity(0.3),
                                                                    width: 1)),
                                                            child:
                                                            Stack(
                                                              children: [
                                                                Center(
                                                                  child:
                                                                  Text(
                                                                    "${classescontroller.subjectlist[index]}",
                                                                    style: TextStyle(fontSize: widget.constraints.minWidth * 0.01),
                                                                  ),
                                                                ),
                                                                Align(
                                                                    alignment: Alignment.topRight,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.only(top: 2, right: 2),
                                                                      child: InkWell(
                                                                        onTap: () {
                                                                          classescontroller.subjectlist.remove(classescontroller.subjectlist[index]);
                                                                          print(classescontroller.subjectlist);
                                                                        },
                                                                        child: Icon(
                                                                          Icons.close,
                                                                          color: Color(0xFF000000),
                                                                          size: widget.constraints.minWidth * 0.009,
                                                                        ),
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ),
                                                PopupMenuButton(
                                                    onSelected: (value) {
                                                      classescontroller
                                                          .addsubjects(value);
                                                      print(classescontroller
                                                          .subjectlist);
                                                    },
                                                    itemBuilder: (builder) {
                                                      return List.generate(
                                                          20,
                                                              (index) =>
                                                              PopupMenuItem(
                                                                child: Text(
                                                                    "Subjects $index"),
                                                                value:
                                                                "Subject $index",
                                                              ));
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color: Color(0xFF000000)
                                                          .withOpacity(0.3),
                                                      size: widget.constraints
                                                          .minWidth *
                                                          0.025,
                                                    ))
                                              ],
                                            ),
                                            height:
                                            widget.constraints.minHeight *
                                                0.087,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height:
                                            widget.constraints.minHeight *
                                                0.07,
                                            width: widget.constraints.minWidth *
                                                0.12,
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
                                                        color:
                                                        Color(0xFFFFFFFF),
                                                        fontSize: widget
                                                            .constraints
                                                            .minWidth *
                                                            0.012,
                                                        fontFamily: roboto),
                                                  ),
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height:
                                            widget.constraints.minHeight *
                                                0.07,
                                            width: widget.constraints.minWidth *
                                                0.12,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                    primary: Color(0xFF7189FF)),
                                                child: Center(
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(
                                                        color:
                                                        Color(0xFFFFFFFF),
                                                        fontSize: widget
                                                            .constraints
                                                            .minWidth *
                                                            0.012,
                                                        fontFamily: roboto),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            )
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
                              size: widget.constraints.minWidth * 0.015,
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

  deletedialog(BuildContext context) {
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
                height: widget.constraints.minHeight * 0.3,
                width: widget.constraints.minWidth * 0.3,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(
                            "Are you Sure?",
                            style: TextStyle(
                                fontFamily: roboto,
                                fontSize: widget.constraints.minWidth * 0.015,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: widget.constraints.minHeight * 0.07,
                            width: widget.constraints.minWidth * 0.12,
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
                                        widget.constraints.minWidth * 0.012,
                                        fontFamily: roboto),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: widget.constraints.minHeight * 0.07,
                            width: widget.constraints.minWidth * 0.12,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF7189FF)),
                                child: Center(
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize:
                                        widget.constraints.minWidth * 0.012,
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
