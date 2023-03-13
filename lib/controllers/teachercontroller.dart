import 'package:get/get.dart';

class TeacherController extends GetxController{
  final check = false.obs;
  List<bool> checkindexes = <bool>[].obs;
  List teacherlist = [].obs;
  List subjectlist = [].obs;
  List classeslist = [].obs;
  final phonenumber = ''.obs;

  addteachers(String teachers){
    teacherlist.add(teachers);
  }
  addsubjects(String subjects){
    subjectlist.add(subjects);
  }
  addclasses(String classes){
    classeslist.add(classes);
  }
  checkboxchanging(bool value){
    check.value = value;
  }
}