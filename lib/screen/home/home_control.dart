import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/util/cache_serves.dart';
import 'package:pharma_me/core/util/custom_function.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';
import 'widgets/home_bottom_nav_bar.dart';

class HomeControl extends StatelessWidget {
  const HomeControl({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
                text: cubit.appBarTitle[cubit.bottomNavBarIndex],
                alignment: Alignment.topCenter,
                isBold: true,
                fontSize: 20),
            actions: [
              IconButton(onPressed: (){
                CacheServes.removeData(key: 'token').then((value) {
        GoRouter.of(context).pushReplacement('/LoginScreen');
        CustomFunction.showSnackBar(message: 'Good bye', context: context, mode: cubit.isDarkMode);
                });
              }, icon: const Icon(Icons.logout))
            ],
            centerTitle: true,
          ),
          body: cubit.homeLayout[cubit.bottomNavBarIndex],
          bottomNavigationBar: HomeBottomNavBar(cubit: cubit),
        );
      },
    );
  }

}






