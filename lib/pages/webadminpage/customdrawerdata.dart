class CustomDrawerData{
  String name;
  String image;
  CustomDrawerData({this.image,this.name});
}

List drawData(){
  List data = <CustomDrawerData>[
    CustomDrawerData(name: "Classes",image: "assets/images/group.svg"),
    CustomDrawerData(name: "Teachers",image: "assets/images/present.svg"),
    CustomDrawerData(name: "Students",image: "assets/images/readbooks.svg"),
    CustomDrawerData(name: "Subjects",image: "assets/images/books.svg"),
  ];
  return data;
}
