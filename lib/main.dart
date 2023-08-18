import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/constant/colors.dart';
import 'package:task_app/routes/app_routes.dart';

void main() async {
  await dotenv.load();
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColors.text,
          displayColor: AppColors.text
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          onSecondary: AppColors.secondary,
          secondary: AppColors.accent,
          background: AppColors.background,
          
        ),
      ),
    );
  }
}