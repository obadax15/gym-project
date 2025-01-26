import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Strings/token.dart';
import '../../business-logic/register/register_cubit.dart';
import '../widgets/makeTextFieldwidget.dart';
import '../widgets/register-button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: height / 3,
                width: width / 3,
                child: Image.asset(
                  'assets/images/img.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Text(
                'Register to the app',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Welcome to the new vision of training'),
              SizedBox(
                height: 40,
              ),

              MakeTextFormField(textEditingController: usernameController,
                  hinttext: 'Enter your username',
                  icon: Icon(Icons.person_outline),
                  textInputType: TextInputType.name),
              SizedBox(height: 10),
              MakeTextFormField(textEditingController: emailController,
                  hinttext: 'Enter your email',
                  icon: Icon(Icons.email_outlined),
                  textInputType: TextInputType.text),
              SizedBox(height: 10),
              MakeTextFormField(textEditingController: passwordController,
                  hinttext: 'Enter your password',
                  icon: Icon(Icons.remove_red_eye_outlined),
                  textInputType: TextInputType.text),
              SizedBox(height: 10),
              MakeTextFormField(textEditingController: passwordConfirmationController,
                  hinttext: 'Confirm your password',
                  icon: Icon(Icons.remove_red_eye_outlined),
                  textInputType: TextInputType.text),
              SizedBox(height: 10),
              MakeTextFormField(textEditingController: phoneNumberController,
                  hinttext: 'Enter your phoneNumber',
                  icon: Icon(Icons.phone_android_outlined), textInputType :TextInputType.phone),
              SizedBox(height: 40),
              RegisterButton(usernameController: usernameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  passwordConfirmationController: passwordConfirmationController,
                  phoneNumberController: phoneNumberController)
            ],
          )
          ,
        )
        ,
      ),
    );
  }
}

