import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/widgets/custom_loading.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';
import 'package:pharma_me/screen/home/layout/warehouse_layout/widgets/list_view_builder.dart';

class WarehouseLayout extends StatelessWidget {
  const WarehouseLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          return state is LoadingGetWarehouseState
              ? const CustomLoading()
              : cubit.warehouseModel.isEmpty?const CustomText(text: 'There are no warehouse ً',alignment: Alignment.center):ListViewBuilder(cubit: cubit,);
        },
    );
  }
}




