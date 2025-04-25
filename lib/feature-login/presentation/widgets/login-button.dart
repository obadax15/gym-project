// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymproject/feature-login/business-logic/login/login_cubit.dart';

import '../../../feature-home-screen/presentation/pages/home-screen.dart';
class LogInButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
final Function formsubmit;
  const LogInButton({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController, required this.formsubmit,

  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LoginState>(

      listener: (context, state) {
        print('Login Status: ${state.loginStatus}');
        if (state.loginStatus == LoginStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('LogIn Successfully'), backgroundColor: Colors.greenAccent),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        } else if (state.loginStatus == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('$state.loginStatus'), backgroundColor: Colors.redAccent),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            await BlocProvider.of<LogInCubit>(context).logIn(
              usernameController.text,
              emailController.text,
              passwordController.text,
            );
            formsubmit();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            width: 150,
            height: 50,
            child: const Center(
              child: Text(
                'Log In',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
