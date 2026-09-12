import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'controllers/auth_controller.dart';
import 'routes/app_routes.dart';
import 'theme/neon_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  runApp(const Day21App());
}

class Day21App extends StatelessWidget {
  const Day21App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Day 21 - GetX MVC',
      initialRoute:AppRoutes.login,
      getPages:AppRoutes.pages,
      theme:ThemeData(
        brightness:Brightness.dark,
        scaffoldBackgroundColor:AppColors.bg,
        colorScheme:ColorScheme.fromSeed(
          seedColor:AppColors.purple,
          brightness:Brightness.dark),
        useMaterial3:true),
    );
  }
}