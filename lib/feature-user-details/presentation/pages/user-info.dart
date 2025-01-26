import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymproject/core/Strings/color.dart';
import 'package:gymproject/feature-user-details/business-logic/getuserdetails_cubit.dart';
class UserInfo extends StatefulWidget {
  UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var userinfo;

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
    return Scaffold(
      backgroundColor: blackop,
      body: Container(
        child: BlocBuilder<GetuserdetailsCubit, GetUserDetailsState>(
          builder: (context, state) {
            if (state.getUserDetailStatus == GetUserDetailStatus.loading ||
                BlocProvider.of<GetuserdetailsCubit>(context).getUserDetails() == null) {
              return Center(
                  child: CircularProgressIndicator(
                color: purbleColor,
              ));
            }
            print(userinfo);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width,
                  height: height / 3,
                  decoration: const BoxDecoration(color: purbleColor),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                          title: const Text(
                            'My Profile',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100.0, // Set a fixed width
                          height: 100.0, // Set a fixed height (same as width to form a circle)
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            // Optional: Clip to ensure the image fits inside the circle
                            child: Image.asset(
                              'assets/images/img.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${userinfo['username']}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your Email',
                      style: TextStyle(color: textPurbleColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                _buildContainer(
                  width,
                  height,
                  '${userinfo['email']}',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your First Name',
                      style: TextStyle(color: textPurbleColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                _buildContainer(
                  width,
                  height,
                  '${userinfo['first_name']}',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Your Last Name',
                      style: TextStyle(color: textPurbleColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                _buildContainer(
                  width,
                  height,
                  '${userinfo['last_name']}',
                ),

              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, double height, String emailornameorlastname) {
    return Container(
      width: width / 2,
      height: height / 15,
      decoration: BoxDecoration(
        color: purbleColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(
          '${emailornameorlastname}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
