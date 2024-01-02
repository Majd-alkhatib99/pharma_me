import 'package:go_router/go_router.dart';
import 'package:pharma_me/screen/auth/login/login_screen.dart';
import 'package:pharma_me/screen/auth/register/register_screen.dart';
import 'package:pharma_me/screen/home/home_control.dart';

import '../../screen/splash/splash_screen.dart';

abstract class AppRoutes{
  static const String loginScreen ='/LoginScreen';
  static const String registerScreen ='/RegisterScreen';
  static const String homeScreen ='/HomeScreen';
  static const String medicineScreen ='/MedicineScreen';

  static final routes = GoRouter(routes:[
    GoRoute(path: '/',builder: (context, state)=> const SplashScreen()),
    GoRoute(path: loginScreen,builder: (context, state)=> const LoginScreen()),
    GoRoute(path: registerScreen,builder: (context, state)=> const RegisterScreen()),
    GoRoute(path: homeScreen,builder: (context, state)=> const HomeControl()),
    // GoRoute(path: medicineScreen,builder: (context, state)=> const MedicineScreen()),

  ]);
}