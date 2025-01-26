import 'package:flutter/material.dart';
import 'package:gymproject/core/Strings/color.dart';
import 'package:gymproject/feature-login/presentation/widgets/register-button.dart';

import '../widgets/login-button.dart';
import '../widgets/makeTextFieldwidget.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool _isupdate = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              _isupdate ? 'Login' : 'Create account',
              style: TextStyle(color: textPurbleColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              _isupdate ? 'Welcome' : 'Let\'s Start!',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            _isupdate
                ? Center(
                    child: Container(
                        child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit\n,ssed do eiusmod tempor incididunt ut labore et dolore\n                              magna aliqua. ',
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  )))
                : Container(),
            Container(
              color: purbleColor,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: _isupdate?width / 6:width/12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width / 2.2),
                    child: _text('Username'),
                  ),
                  MakeTextFormField(
                      textEditingController: usernameController,
                      hinttext: 'Enter your username',
                      icon: Icon(Icons.person_outline),
                      textInputType: TextInputType.name),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(right: width / 1.8),
                    child: _text('Email'),
                  ),
                  MakeTextFormField(
                      textEditingController: emailController,
                      hinttext: 'Enter your email',
                      icon: Icon(Icons.email_outlined),
                      textInputType: TextInputType.text),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(right: width / 2.2),
                    child: _text('Password'),
                  ),
                  MakeTextFormField(
                      textEditingController: passwordController,
                      hinttext: 'Enter your password',
                      icon: Icon(Icons.remove_red_eye_outlined),
                      textInputType: TextInputType.text),
                  SizedBox(height: 30),


                 _isupdate? Container(): Padding(
                    padding: EdgeInsets.only(right: width / 3),
                    child: _text('Confirm Password'),
                  ),
                 _isupdate? Container():MakeTextFormField(
                      textEditingController: passwordConfirmationController,
                      hinttext: 'confirm your password',
                      icon: Icon(Icons.remove_red_eye_outlined),
                      textInputType: TextInputType.text),
                  SizedBox(height: 30),
                _isupdate? Container(): Padding(
                    padding: EdgeInsets.only(right: width / 3),
                    child: _text('Add PhoneNumber'),
                  ),
                  _isupdate?Container():
                  MakeTextFormField(
                      textEditingController: phoneNumberController,
                      hinttext: 'Enter your phoneNumber',
                      icon: Icon(Icons.phone_iphone_outlined),
                      textInputType: TextInputType.phone),
                  SizedBox(                    height: _isupdate?width / 6:width/10,
                  ),

                ],
              ),
            ),
            SizedBox(
              height: _isupdate?width / 6:width/12,
            ),
            _isupdate
                ? LogInButton(
                    usernameController: usernameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  )
                : RegisterButton(
                    usernameController: usernameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    passwordConfirmationController: passwordConfirmationController,
                    phoneNumberController: phoneNumberController),
            SizedBox(
              height: width / 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isupdate
                      ?"Dont\'t have an account" :'You have an account ',
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  child: Text(
                    _isupdate
                        ?  "SignUp":"Login",
                    style: TextStyle(color: purbleColor),
                  ),
                  onTap: () {
                    setState(() {
                      _isupdate = !_isupdate;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Text _text(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}
