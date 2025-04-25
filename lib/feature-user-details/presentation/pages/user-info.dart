import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymproject/core/Strings/color.dart';
import 'package:gymproject/feature-user-details/business-logic/addupdcubit/addupdate_addition_usd__cubit.dart';
import 'package:gymproject/feature-user-details/business-logic/getuserdetails_cubit.dart';
import 'package:gymproject/feature-user-details/presentation/widgets/make_drawer.dart';
import '../widgets/builduserinfosection.dart';
import '../widgets/maketextformfield.dart';

class UserInfo extends StatefulWidget {
  UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController heightt = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController specific_injury = TextEditingController();
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<GetuserdetailsCubit>(context).getUserDetails();
    });
  }

  void setUserDataIfEmpty(Map<String, dynamic> additionUserInfo) {
    // Ensure that null values are handled properly
    if (heightt.text.isEmpty && additionUserInfo['height'] != null) {
      heightt.text = additionUserInfo['height'].toString();
    } else if (heightt.text.isEmpty) {
      heightt.text = '0.0';  // Provide a fallback value
    }

    if (weight.text.isEmpty && additionUserInfo['weight'] != null) {
      weight.text = additionUserInfo['weight'].toString();
    } else if (weight.text.isEmpty) {
      weight.text = '0.0';  // Provide a fallback value
    }

    if (age.text.isEmpty && additionUserInfo['age'] != null) {
      age.text = additionUserInfo['age'].toString();
    } else if (age.text.isEmpty) {
      age.text = '0';  // Provide a fallback value
    }

    if (gender.text.isEmpty && additionUserInfo['gender'] != null) {
      gender.text = additionUserInfo['gender'];
    } else if (gender.text.isEmpty) {
      gender.text = 'Not specified';  // Provide a fallback value
    }

    if (specific_injury.text.isEmpty && additionUserInfo['specific_injury'] != null) {
      specific_injury.text = additionUserInfo['specific_injury'];
    } else if (specific_injury.text.isEmpty) {
      specific_injury.text = 'None';  // Provide a fallback value
    }
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackop.withOpacity(0),
        leadingWidth: 200,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 20, color: Colors.white),
            ),
            const Text('My Profile',
              style: TextStyle(color: Color.fromRGBO(200, 108, 254, 1), fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      endDrawer: const makeDrawer(),
      backgroundColor: blackop,
      body: SingleChildScrollView(
        child: BlocBuilder<GetuserdetailsCubit, GetUserDetailsState>(
          builder: (context, state) {
            if (state.getUserDetailStatus == GetUserDetailStatus.loading) {
              return const Center(child: CircularProgressIndicator(color: purbleColor));
            }

            if (state.getUserDetailStatus == GetUserDetailStatus.success) {
              var userinfo = BlocProvider.of<GetuserdetailsCubit>(context).rr;
              var additionUserInfo = BlocProvider.of<GetuserdetailsCubit>(context).ad;

              // ✅ Check for null values
              if (userinfo == null || additionUserInfo == null) {
                return const Center(child: Text('User data not available', style: TextStyle(color: Colors.white)));
              }

              setUserDataIfEmpty(additionUserInfo); // ✅ Only set values once

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: width,
                    height: height / 3,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: const BoxDecoration(shape: BoxShape.circle),
                            child: ClipOval(
                              child: Image.asset('assets/images/img.png', fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text('${userinfo['username'] ?? 'Guest'}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  BuildUserInfoSection(title: 'Your Email', value: userinfo['email'] ?? 'N/A'),
                  BuildUserInfoSection(title: 'Your First Name', value: userinfo['first_name'] ?? 'N/A'),
                  BuildUserInfoSection(title: 'Your Last Name', value: userinfo['last_name'] ?? 'N/A'),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Tap To Edit',
                          style: TextStyle(color: newpurble, fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                          onPressed: () => setState(() => isEditing = !isEditing),
                          icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldForming(textEditingController: heightt, textInputType: TextInputType.number, height: height / 12, width: width / 6, title: 'Height', isediting: isEditing,font_size: height/50, distance: 0, alignmentGeometry: Alignment.bottomLeft,),
                        TextFieldForming(textEditingController: weight, textInputType: TextInputType.number, height: height / 12, width: width / 6, title: 'Weight', isediting: isEditing,font_size: height/50, distance: 0, alignmentGeometry: Alignment.bottomLeft),
                        TextFieldForming(textEditingController: age, textInputType: TextInputType.number, height: height / 12, width: width / 6, title: 'Age', isediting: isEditing,font_size: height/50, distance: 0, alignmentGeometry: Alignment.bottomLeft),
                        TextFieldForming(textEditingController: gender, textInputType: TextInputType.text, height: height / 12, width: width / 6, title: 'Gender', isediting: isEditing,font_size: height/50, distance: 0, alignmentGeometry: Alignment.bottomLeft),
                        TextFieldForming(textEditingController: specific_injury, textInputType: TextInputType.text, height: height / 12, width: width / 6, title: 'Injury', isediting: isEditing,font_size: height/50, distance: 0, alignmentGeometry: Alignment.bottomLeft),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  isEditing ? buildSaveButton() : Container(),
                ],
              );
            }

            return const Center(child: Text('Failed to load user data', style: TextStyle(color: Colors.white)));
          },
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<AddUpdateUserDetailsCubit, AddUpdateUserDetailsState>(
      listener: (context, state) {
        if (state.addUpdUserDetailsStatus == AddUpdUserDetailsStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Details Edited successfully'), backgroundColor: Colors.white38));
        } else if (state.addUpdUserDetailsStatus == AddUpdUserDetailsStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please check your internet'), backgroundColor: Colors.redAccent));
        }
      },
      builder: (context, state) {
        if (state.addUpdUserDetailsStatus == AddUpdUserDetailsStatus.loading) {
          return const CircularProgressIndicator(color: Colors.black87);
        }
        return GestureDetector(
          onTap: () async {
            await BlocProvider.of<AddUpdateUserDetailsCubit>(context).addUpdUserDet(
              double.tryParse(heightt.text) ?? 0.0,
              double.tryParse(weight.text) ?? 0.0,
              int.tryParse(age.text) ?? 0,
              gender.text,
              specific_injury.text,
            );
            setState(() {
              isEditing = !isEditing;
            });
            BlocProvider.of<GetuserdetailsCubit>(context).getUserDetails();
          },
          child: Container(
            height: height / 17,
            width: width / 3,
            decoration: BoxDecoration(color: newpurble, borderRadius: BorderRadius.circular(20)),
            child: const Center(child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
          ),
        );
      },
    );
  }
}
