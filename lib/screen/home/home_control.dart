import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/util/cache_serves.dart';
import '../../core/widgets/custom_text.dart';

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
                CacheServes.removeData(key: 'token');
              }, icon: Icon(Icons.ac_unit))
            ],
            centerTitle: true,
          ),
          body: cubit.homeLayout[cubit.bottomNavBarIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.bottomNavBarIndex,
            onTap: (int index) => cubit.changeBottomNavBarIndex(index),
            elevation: 0.0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.warehouse), label: 'Warehouse'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_cozy), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Orders'),
            ],
          ),
        );
      },
    );
  }
}
