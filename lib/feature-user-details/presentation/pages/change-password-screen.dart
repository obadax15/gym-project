import 'package:flutter/material.dart';
import 'package:gymproject/feature-home-screen/presentation/widgets/appbarwidgets.dart';

import '../../../core/Strings/color.dart';
import '../widgets/maketextformfield.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({Key? key, required this.text}) : super(key: key);
TextEditingController textEditingController=TextEditingController();
final String text;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: blackop,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
        Row(children: [
          IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)),
        Text(text,style: const TextStyle(
          color: Color.fromRGBO(200, 108, 254, 1),
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),),
        ],),
        SizedBox(height: height/15,),
        
        TextFieldForming(textEditingController: textEditingController, textInputType: TextInputType.emailAddress, height: height/18, width: width/1.5, title: 'Enter Your Email', isediting: true,font_size: height/40, distance: 20, alignmentGeometry: Alignment.center,)     ,
        
          SizedBox(height: height/2,),
            makeSaveButton(context),
          ],
        
        
        ),
      ),

    );
  }
  Widget makeSaveButton(BuildContext context){
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){},
      child: Container(
        width:width/3 ,
        height: height/24,
        decoration: BoxDecoration(color: newpurble,
        borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child:  Text('Next',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: width/18 ),)),
      ),

    );
  }
}
