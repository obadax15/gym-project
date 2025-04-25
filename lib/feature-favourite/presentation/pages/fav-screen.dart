import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymproject/core/Strings/color.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20,),
        Align(
            alignment: Alignment.topCenter,


            child: Text('Favourites',style: TextStyle(color: purbleColor,fontSize: 22,fontWeight: FontWeight.bold),)
        ),
        SizedBox(height: 200,),
        Center(child: Text('there is no favourites yet',style: TextStyle(color: Colors.white,fontSize: 12),))

      ],
    );
  }
}
