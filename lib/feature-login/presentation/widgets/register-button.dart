import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Strings/token.dart';
import '../../../feature-home-screen/presentation/pages/home-screen.dart';
import '../../business-logic/register/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final  TextEditingController passwordConfirmationController;
  final  TextEditingController phoneNumberController;

  const RegisterButton({super.key, required this.usernameController, required this.emailController, required this.passwordController, required this.passwordConfirmationController, required this.phoneNumberController});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.registerStatus == RegisterStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Register Successfully'),backgroundColor: Colors.greenAccent,));
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            print(Token.token);
            await BlocProvider.of<RegisterCubit>(context).register(
              usernameController.text,
              emailController.text,
              passwordController.text,
              passwordConfirmationController.text,
              phoneNumberController.text,
            );

          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            width: 120,
            height: 40,
            child: Center(
              child: Text(
                'Sign up',

                style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),),
          ),
        );
      },
    );
  }
}