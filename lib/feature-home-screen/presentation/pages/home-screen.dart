import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymproject/feature-home-screen/presentation/widgets/general-exercise-widget.dart';
import 'package:gymproject/feature-login/presentation/pages/login-screen.dart';
import 'package:gymproject/feature-login/presentation/pages/register-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/Strings/color.dart';
import '../../../feature-login/business-logic/logout_cubit.dart';
import '../../../feature-workouts/presentation/pages/workouts-screen.dart';
import '../widgets/appbarwidgets.dart';
import '../widgets/weekly-workouts-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      backgroundColor: blackop,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            const AppBarWidget(title: 'Hi,Obada'),

            const Padding(
              padding: EdgeInsets.only(left: 18.0,),
              child: Align(
               alignment: Alignment.centerLeft,
                child:  Text(
                  'It\'s time to change your limits',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            _buildiconsListview(),

const Padding(
  padding: EdgeInsets.only(left: 18.0),
  child: Align(
      alignment: Alignment.centerLeft,
      child: Text('Recommedtation',style: TextStyle(color: textPurbleColor,fontWeight: FontWeight.w600,fontSize: 20),)),
),
const Padding(
  padding: EdgeInsets.all(8.0),
  child: Row(children: [
    GeneralExerciseWidget(),
    GeneralExerciseWidget(),

  ],),
),
            const SizedBox(height: 10,),
            Container(width: double.infinity,
            height: height/5,
            decoration: const BoxDecoration(color: purbleColor),
            child: const Center(
              child: WeeklyWorkOutWidget(),
            ),
            ),


            BlocConsumer<LogOutCubit, LogOutState>(
              listener: (context, state) {
                if (state.logOUtStatus == LogOUtStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Log out Successfully'),
                    backgroundColor: Colors.greenAccent,
                  ));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LogInScreen()));
                }else{ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Log out Successfully'),
                  backgroundColor: Colors.red,
                ));}
              },
              builder: (context, state) {
                return ListTile(
                  title: const Text('LogOUt'),
                  trailing: IconButton(
                    onPressed: () async{
                      await BlocProvider.of<LogOutCubit>(context).logout();
                      clearToken();
                    },
                    icon: const Icon(Icons.logout),
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
  }
}

ConvexAppBar _bottomBar() {
  return ConvexAppBar(
    color: Colors.white,
    backgroundColor: textPurbleColor,
    style: TabStyle.react,
    // Available styles: fixed, react, etc.
    items: const [
      TabItem(icon: Icons.home_outlined, title: 'Home'),
      TabItem(icon: Icons.search, title: 'Search'),
      TabItem(icon: Icons.favorite_border_outlined, title: 'Fav'),
      TabItem(icon: Icons.support_agent_outlined, title: 'Support'),
    ],
    initialActiveIndex: 0,
    // Default active index
    onTap: (int index) {
    },
  );
}

Route _createSlideRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const WorkOutsScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0); // Slide from the right
      var end = Offset.zero; // End at the original position
      var curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
Widget _buildiconsListview() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final icontext = ['Workouts', 'Progress', 'Nutrition', 'Community'];

          return Row(
            children: [
              GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.of(context).push(_createSlideRoute());
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => RegisterScreen()));
                    }

                  },
                  child: Column(
                    children: [
                      Icon(
                        index == 0
                            ? Icons.sports_bar_outlined
                            : index == 1
                                ? Icons.schedule_outlined
                                : index == 2
                                    ? Icons.apple_outlined
                                    : Icons.groups_outlined,
                        size: 40,
                        color: textPurbleColor,
                      ),
                      Text(
                        icontext[index],
                        style: const TextStyle(fontSize: 12, color: textPurbleColor),
                      ),
                    ],
                  )),
              if (index < 3)
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      thickness: 2, // Thickness of the line
                      color: textPurbleColor, // Color of the line
                    ),
                  ),
                ),
            ],
          );
        },
        itemCount: 4,
      ),
    ),
  );
}
