import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymproject/feature-home-screen/presentation/pages/home-screen.dart';
import 'package:gymproject/feature-login/business-logic/login/login_cubit.dart';
import 'package:gymproject/feature-login/business-logic/logout_cubit.dart';
import 'package:gymproject/feature-login/business-logic/register/register_cubit.dart';
import 'package:gymproject/feature-user-details/business-logic/addupdcubit/addupdate_addition_usd__cubit.dart';
import 'package:gymproject/feature-user-details/business-logic/getuserdetails_cubit.dart';
import 'package:gymproject/feature-user-details/presentation/pages/user-info.dart';
import 'package:gymproject/feature-workouts/presentation/pages/workouts-screen.dart';
import 'package:gymproject/splash-view/pages/splash-screen.dart';

import 'feature-Nutritional-plan/presentation/screens/food-categories-screen.dart';
import 'feature-login/page-view/page-view.dart';
import 'feature-login/presentation/pages/register-screen.dart';
import 'feature-navigation/navigation-screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
BlocProvider(create: (_)=>RegisterCubit()),
BlocProvider(create: (_)=>LogInCubit()),
BlocProvider(create: (_)=>GetuserdetailsCubit()),
BlocProvider(create: (_)=>LogOutCubit()),
BlocProvider(create: (_)=>AddUpdateUserDetailsCubit()),
    ], child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationScreen(),
    );
  }
}
