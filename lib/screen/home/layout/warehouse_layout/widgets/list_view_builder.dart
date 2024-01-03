import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'item_builder.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key, required this.cubit});

  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: ()=>cubit.getWarehouses(),
      showChildOpacityTransition: false,
      color: ColorData.midPurple2,
      child: ListView.builder(
        // physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => ItemBuilder(cubit: cubit, index: index),
        itemCount: cubit.warehouseModel.length,
      ),
    );
  }
}