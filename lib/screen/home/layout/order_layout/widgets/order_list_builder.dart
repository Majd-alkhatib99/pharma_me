import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/models/orders_model.dart';
import 'package:pharma_me/core/util/color_data.dart';

import 'order_item_builder.dart';

class OrderListBuilder extends StatelessWidget {
  const OrderListBuilder(
      {super.key, required this.ordersModel, required this.cubit});

  final List<OrdersModel> ordersModel;
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: ()=>cubit.getOrders(),
      color: ColorData.midPurple2,
      child: ListView.builder(
        itemBuilder: (context, index) =>
            OrderItemBuilder(orderModel: ordersModel[index], cubit: cubit),
        itemCount: ordersModel.length,
      ),
    );
  }
}