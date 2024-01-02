import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/widgets/custom_loading.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';

import 'widgets/order_list_builder.dart';

class OrderLayout extends StatelessWidget {
  const OrderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return state is LoadingGetOrderState
            ? const CustomLoading()
            : cubit.ordersModel.isEmpty
                ? const CustomText(text: 'There are no orders',alignment: Alignment.center,)
                : OrderListBuilder(
                    ordersModel: cubit.ordersModel,
                    cubit: cubit,
                  );
      },
    );
  }
}




