// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymproject/feature-home-screen/presentation/widgets/general-exercise-widget.dart';
import 'package:gymproject/feature-user-details/business-logic/getuserdetails_cubit.dart';
import '../../../core/Strings/color.dart';
import '../widgets/appbarwidgets.dart';
import '../widgets/buildiconslistview.dart';
import '../widgets/convexbotttombar.dart';
import '../widgets/weekly-workouts-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetuserdetailsCubit>(context).getUserDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            BlocBuilder<GetuserdetailsCubit, GetUserDetailsState>(
              builder: (context, state) {
                var rr = BlocProvider.of<GetuserdetailsCubit>(context).rr;

                if (state.getUserDetailStatus == GetUserDetailStatus.loading) {
                  return const CircularProgressIndicator(color: Colors.white);
                }

                if (rr == null || rr['username'] == null) {
                  return const AppBarWidget(title: 'Hello', name: 'Guest');
                }

                return AppBarWidget(title: 'Hello', name: rr['username']);
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('It\'s time to change your limits', style: TextStyle(color: Colors.white, fontSize: 13)),
              ),
            ),
            const SizedBox(height: 12),
            const MakeIconsListView(),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Recommedtation',
                      style: TextStyle(color: textPurbleColor, fontWeight: FontWeight.w600, fontSize: 20))),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GeneralExerciseWidget(),
                  GeneralExerciseWidget(),
                ],
              ),
            ),
             SizedBox(height: height/18),
            const Center(child: WeeklyWorkOutWidget()),
          ],
        ),
      )
    );
  }
}
