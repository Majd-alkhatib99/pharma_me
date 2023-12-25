import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key,required this.cubit});

  final MainCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: cubit.bottomNavBarIndex,
      onTap: (int index) =>cubit.changeBottomNavBarIndex(index),
      elevation: 0.0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.warehouse), label: 'Warehouse'),
        BottomNavigationBarItem(
            icon: Icon(Icons.view_cozy), label: 'Categories'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'Orders'),
      ],
    );
  }
}