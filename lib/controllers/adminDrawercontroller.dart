
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminDrawerController extends GetxController{
  final  currentdrawer = 0.obs;
  BoxConstraints constraints;

  get selectedIndex => currentdrawer.value;
  set selectedIndex(index) => currentdrawer.value = index;
}