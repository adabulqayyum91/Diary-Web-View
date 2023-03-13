import 'package:dairyadmin/res/customfonts.dart';
import 'package:flutter/material.dart';
class CustomTextfield extends StatefulWidget {

  CustomTextfield({
    this.size,
    this.label,
    this.textEditingController,
    this.hint,
    this.ispassword,
    this.valid,
    this.textInputType
  }) ;
  final String label;
  final String hint;
  final TextEditingController textEditingController;
  final BoxConstraints size;
  final String valid;
  final bool ispassword;
  final TextInputType textInputType;
  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool obsec = true;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
/*
          Text(widget.label,style: TextStyle(color: Color(0xFF253274),fontFamily: roboto,fontWeight: FontWeight.w500,*/
/*fontSize: widget.size.width*0.03*//*
),),
*/
/*
          SizedBox(height: 5,),
*/
          Center(
            child: TextFormField(
              controller: widget.textEditingController,
              validator: (value){
                if(value.isEmpty){
                  return widget.valid;
                }


                return null;
              },

              keyboardType: widget.textInputType,
              obscureText: widget.ispassword == true && obsec == true?true:false,
              decoration: InputDecoration(
errorStyle: TextStyle(fontSize: widget.size.minWidth>1030?widget.size.minWidth*0.009:widget.size.minWidth*0.02),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF7189FF))
                ),
                 /* suffixIcon: widget.ispassword == true?IconButton(onPressed: (){
                    setState(() {
                      if(obsec == true){
                        obsec =  false;
                      }else{
                        obsec = true;
                      }
                    });
                  }
                    ,icon: ImageIcon(AssetImage("assets/images/eye.png"),color: obsec==true?Color(0xFF7C84AC):Colors.blue,),):null,*/
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Color(0xFF7189FF),width: 1,style: BorderStyle.solid)
                  ),
                  hintText: widget.hint,

                  hintStyle: TextStyle(
                    color: Color(0xFF253274).withOpacity(0.3)
                    ,fontWeight: FontWeight.w300,
                    fontSize: widget.size.minWidth>1030?widget.size.minWidth*0.009:widget.size.minWidth*0.028,
                  )
              ),
            ),
          )
        ],
      );
  }
}
