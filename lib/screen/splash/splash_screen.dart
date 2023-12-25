import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pharma_me/core/util/cache_serves.dart';
import 'package:pharma_me/core/util/color_data.dart';

import '../../core/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Lottie.asset('assets/images/splash.json'),
          const CustomText(
            text: 'PharmaMe',
            fontSize: 50,
            alignment: Alignment.center,
          ),
          const CustomText(
            text: 'Buy your medicines easily',
            alignment: Alignment.center,
            color: ColorData.midPurple2,
          ),
        ],
      ),
    );
  }

  void navigateToNextScreen() {
    String? token = CacheServes.getData(key: 'token');
    Future.delayed(
      const Duration(seconds:6),
      () {
        GoRouter.of(context).pushReplacement(
          token==null? '/LoginScreen' : '/HomeScreen',
          // false? '/LoginScreen' : '/HomeScreen',
        );
      },
    );
  }
}
