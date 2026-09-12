import 'package:get/get.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/signup_view.dart';

class AppRoutes {
  static const login='/login';
  static const signup='/signup';
  static const home='/home';

  static final pages=<GetPage>[
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: signup, page: () => SignupView()),
    GetPage(name: home, page: () => const HomeView()),
  ];
}