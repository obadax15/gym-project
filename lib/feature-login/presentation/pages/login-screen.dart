import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymproject/core/Strings/color.dart';
import 'package:gymproject/feature-login/presentation/widgets/register-button.dart';
import 'package:gymproject/feature-user-details/presentation/pages/change-password-screen.dart';
import '../widgets/login-button.dart';
import '../widgets/makeTextFieldwidget.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key, required this.isupdate}) : super(key: key);
  bool isupdate;

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Proceed with login or registration logic
      print("Form is valid, proceed!");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
      body: SingleChildScrollView(
        child:  Column(
              children: [
                SizedBox(height: 20),
                Text(
                  widget.isupdate ? 'Login' : 'Create account',
                  style: TextStyle(color: textPurbleColor, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 40),
                Text(
                  widget.isupdate ? 'Welcome' : 'Let\'s Start!',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                widget.isupdate
                    ? Center(
                  child: Container(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                      style: TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                  ),
                )
                    : Container(),
                Container(
                  color: purbleColor,
                  width: width,
                  child: Form(
                    key: _formKey, // Wrap form with key
                    child: Column(
                      children: [
                        SizedBox(height: widget.isupdate ? width / 6 : width / 12),
                        Padding(
                          padding: EdgeInsets.only(right: width / 2.2),
                          child: _text('Username'),
                        ),
                        MakeTextFormField(
                          textEditingController: usernameController,
                          hinttext: 'Enter your username',
                          icon: Icon(Icons.person_outline),
                          textInputType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill the username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(right: width / 1.8),
                          child: _text('Email'),
                        ),
                        MakeTextFormField(
                          textEditingController: emailController,
                          hinttext: 'Enter your email',
                          icon: Icon(Icons.email_outlined),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill your Email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(right: width / 2.2),
                          child: _text('Password'),
                        ),
                        MakeTextFormField(
                          textEditingController: passwordController,
                          hinttext: 'Enter your password',
                          icon: Icon(Icons.remove_red_eye_outlined),
                          textInputType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        if (!widget.isupdate)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: width / 3),
                                child: _text('Confirm Password'),
                              ),
                              MakeTextFormField(
                                textEditingController: passwordConfirmationController,
                                hinttext: 'Confirm your password',
                                icon: Icon(Icons.remove_red_eye_outlined),
                                textInputType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please fill confirm password';
                                  }
                                  if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 30),
                              Padding(
                                padding: EdgeInsets.only(right: width / 3),
                                child: _text('Add Phone Number'),
                              ),
                              MakeTextFormField(
                                textEditingController: phoneNumberController,
                                hinttext: 'Enter your phone number',
                                icon: Icon(Icons.phone_iphone_outlined),
                                textInputType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please fill your phone number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: width / 10),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: widget.isupdate ? width / 6 : width / 12),
                widget.isupdate
                    ? LogInButton(
                  usernameController: usernameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  formsubmit: _submitForm,
                )
                    : RegisterButton(
                  usernameController: usernameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  passwordConfirmationController: passwordConfirmationController,
                  phoneNumberController: phoneNumberController,
                  formsubmit: _submitForm,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: InkWell(
                    child: Text(

                      'Forget Password ?',style: TextStyle(color: Colors.white),),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(_)=> ChangePasswordScreen(text: 'Forget Password',)));
                    },
                  ),
                ),
                SizedBox(height: width / 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.isupdate ? "Don't have an account? " : 'You have an account? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      child: Text(
                        widget.isupdate ? "Sign Up" : "Login",
                        style: TextStyle(color: purbleColor),
                      ),
                      onTap: () {
                        setState(() {
                          widget.isupdate = !widget.isupdate;
                        });
                      },
                    ),
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
