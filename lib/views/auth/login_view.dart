import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/constant/images.dart';
import 'package:task_app/providers/auth_provider.dart';
import 'package:task_app/routes/app_routes.dart';
import 'package:task_app/widgets/custom_rich_text.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final formKey             = GlobalKey<FormState>();
    final emailController     = TextEditingController();
    final passwordController  = TextEditingController();
    double screenHeight       = MediaQuery.of(context).size.height;
    final authService         = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1,),

                SvgPicture.asset(
                  AppImages.lock,
                  height: screenHeight * 0.15,
                ),

                SizedBox(height: screenHeight * 0.05,),

                // Login form
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                
                        // Email input
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email)
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.025,),
                
                        // Password input
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            label: Text('Password'),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock)
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.015,),
                        
                        // Forgot Password?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector     (
                              child: const Text('Forgot Password?'),
                              onTap: () {},
                            ),
                          ],
                        ),

                        SizedBox(height: screenHeight * 0.045,),

                        // Button submit
                        SizedBox(
                          height: screenHeight * 0.05,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final response = await authService.login(emailController.text, passwordController.text);
                              
                            }, 
                            child: const Text('Sign in', style: TextStyle(fontSize: 18),)
                          ),
                        ),
                      ],
                    )
                  ),
                ),

                  SizedBox(height: screenHeight * 0.015,),

                  CustomRichText(
                    title: "Don't have an account? ", 
                    textSpan: "Register here", 
                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.register, (route) => false)
                  ),

                  SizedBox(height: screenHeight * 0.2,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}