import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';

import 'item_builder.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key, required this.cubit});

  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ItemBuilder(cubit: cubit, index: index),
      itemCount: cubit.warehouseModel.length,
    );
  }
}