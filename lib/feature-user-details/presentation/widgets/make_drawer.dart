import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymproject/core/Strings/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../feature-login/business-logic/logout_cubit.dart';
import '../../../feature-login/presentation/pages/login-screen.dart';
import '../pages/change-password-screen.dart';
class makeDrawer extends StatelessWidget {
  const makeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      elevation: 1,
      backgroundColor: purbleColor.withOpacity(0.9),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChangePasswordScreen(text: 'Change Password',)));
                },
                child: ListTile(
                  leading: Text(
                    'Change Password',
                    style: TextStyle(color:  Colors.black54, fontSize: 20),

                  ),
                  trailing: Icon(Icons.password_outlined),
                ),
              ),

              ListTile(
                leading: Text(
                  'Send Feedback',
                  style: TextStyle(color: Colors.black54, fontSize: 20),

                ),
                trailing: Icon(Icons.feedback_outlined),
              ),
              ListTile(
                leading: Text(
                  'Settings',
                  style: TextStyle(color:  Colors.black54, fontSize: 20),

                ),
                trailing: Icon(Icons.settings_outlined,),
              ),
            ],
          ),
          Row(

            children: [


           Expanded(child: ListTile(
             leading:    BlocConsumer<LogOutCubit, LogOutState>(
               listener: (context, state) {
                 if (state.logOUtStatus == LogOUtStatus.success) {
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                     content: Text('Log out Successfully'),
                     backgroundColor: Colors.greenAccent,
                   ));

                   Navigator.of(context)
                       .pushReplacement(MaterialPageRoute(builder: (_) => LogInScreen(isupdate: true)));
                 } else {
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                     content: Text('Log out Failed'),
                     backgroundColor: Colors.red,
                   ));
                 }
               },
               builder: (context, state) {
                 return GestureDetector(
                   onTap: () async {
                     await BlocProvider.of<LogOutCubit>(context).logout();
                     clearToken();
                   },
                   child: Container(
                     width: 90,
                     height: 40,
                     decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(20)),
                     child:  Center(
                       child: Text(
                           'LogOut',
                           style: TextStyle(color: Colors.black87, fontSize: 20,fontWeight: FontWeight.bold),


                       ),
                     ),
                   ),
                 );
               },
             ),
           )),
            ],

          ),

        ],
      ),
    );  }
}


Future<void> clearToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('authToken');
}