import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymproject/feature-home-screen/presentation/pages/home-screen.dart';
import 'package:gymproject/feature-login/business-logic/login/login_cubit.dart';
import 'package:gymproject/feature-login/business-logic/logout_cubit.dart';
import 'package:gymproject/feature-login/business-logic/register/register_cubit.dart';
import 'package:gymproject/feature-user-details/business-logic/getuserdetails_cubit.dart';
import 'package:gymproject/splash-view/pages/splash-screen.dart';

import 'feature-login/page-view/page-view.dart';
import 'feature-login/presentation/pages/register-screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
BlocProvider(create: (_)=>RegisterCubit()),
BlocProvider(create: (_)=>LogInCubit()),
BlocProvider(create: (_)=>GetuserdetailsCubit()),
BlocProvider(create: (_)=>LogOutCubit()),
    ], child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
