import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/Strings/color.dart';

class Card_Excercise extends StatelessWidget {
  const Card_Excercise({Key? key, required this.excercisename, required this.repititionnumber, required this.excercisetime}) : super(key: key);
  final String excercisename;
  final int repititionnumber;
  final int excercisetime;

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.only(left: 30,right: 30,),
      height: MediaQuery.of(context).size.height/12,
      width: MediaQuery.of(context).size.width/2,
      child: Card(

        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/img_14.png'),
            ),
            Expanded(child: ListTile(title: Text(excercisename,style: TextStyle(fontWeight: FontWeight.bold ),),trailing: Text('Repitition'+'${repititionnumber}'+'x',style: TextStyle(color:newpurble,),),subtitle: Text('00'+'${excercisetime}',style: TextStyle(color:textPurbleColor,),) ,))
          ],
        ),
      ),
    );
  }
}
