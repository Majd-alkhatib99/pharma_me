import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'widgets/home_app_bar.dart';
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
          appBar: HomeAppBar(title: cubit.appBarTitle[cubit.bottomNavBarIndex]) as PreferredSizeWidget,
          body: cubit.homeLayout[cubit.bottomNavBarIndex],
          bottomNavigationBar: HomeBottomNavBar(cubit: cubit),
        );
      },
    );
  }
  // PreferredSizeWidget HomeAppBar
}






