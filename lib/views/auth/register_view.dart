import 'package:flutter/material.dart';
import 'package:task_app/routes/app_routes.dart';
import 'package:task_app/widgets/custom_rich_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Register'),
              
               CustomRichText(
                title: "Already have an account? ", 
                textSpan: "Sign in", 
                onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false)
              )
            ],
          )
          ),
      ),
    );
  }
}