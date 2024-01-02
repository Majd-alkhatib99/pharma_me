import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/models/orders_model.dart';

import 'order_item_builder.dart';

class OrderListBuilder extends StatelessWidget {
  const OrderListBuilder(
      {super.key, required this.ordersModel, required this.cubit});

  final List<OrdersModel> ordersModel;
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          OrderItemBuilder(orderModel: ordersModel[index], cubit: cubit),
      itemCount: ordersModel.length,
    );
  }
}