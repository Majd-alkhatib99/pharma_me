import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/util/custom_function.dart';
import 'package:pharma_me/core/widgets/custom_button.dart';
import 'package:pharma_me/core/widgets/custom_loading.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';
import 'widgets/medicine_list_items_builder.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key,
    required this.appBarTitle,
    required this.medicineModelList,
    required this.warehouseId});
  final String appBarTitle;
  final List<MedicineModel> medicineModelList;
  final int warehouseId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        if (state is SuccessCreateOrderState) {
          cubit.changeBottomNavBarIndex(2);
          CustomFunction.showSnackBar(
              message: state.message,
              context: context,
              mode: cubit.isDarkMode);
          GoRouter.of(context).pushReplacement('/HomeScreen',);
          MainCubit.get(context).itemsQuantity.clear();
          MainCubit.get(context).orders.clear();

        }
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return Scaffold(
            key: cubit.medicineScaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  InkWell(
                    onTap: () {
                      cubit.getWarehouses();
                      Navigator.pop(context);
                      cubit.orders.clear();
                      cubit.itemsQuantity.clear();
                      cubit.catIndex=0;
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: '$appBarTitle Warehouse',
                    isBold: true,
                    fontSize: 18,
                  ),
                ],
              ),
              actions: [
                cubit.orders.isEmpty
                    ? const SizedBox()
                    : checkOrder(cubit, warehouseId),
              ],
            ),
            body: state is LoadingGetMedicineFromWarehouse ||state is LoadingCreateOrderState
                ? const CustomLoading()
                : medicineModelList.isEmpty
                ? const Center(
              child: CustomText(
                text: 'There are no medications in this warehouse',
                alignment: Alignment.center,
              ),
            )
                : LiquidPullToRefresh(
              onRefresh:()=> cubit.getMedicineFromWarehouse(warehouseId: warehouseId),
                  color: ColorData.midPurple2,
                  showChildOpacityTransition: false,
                  child: MedicineListItemsBuilder(
                      medicineModelList: medicineModelList,
                      medicineCat: cubit.medicineCat,
                      catIndex: cubit.catIndex,
                      warehouseId: warehouseId,
                              ),
                ));
      },
    );
  }

  Widget checkOrder(MainCubit cubit, int warehouseId) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              cubit.medicineScaffoldKey.currentState!.showBottomSheet((
                  context) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomText(
                          text: 'Your order:',
                          alignment: Alignment.center,
                          isBold: true),
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return bottomSheetContent(
                                  key: cubit.orders[index].name!,
                                  context: context,
                                  index: index);
                            },
                            itemCount: cubit.orders.length),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40.0,
                        width: 140.0,
                        child: CustomButton(
                          onPress: () {
                            Navigator.pop(context);
                            cubit.submitOrder(warehouseId);
                            },
                          color: ColorData.midPurple2,
                          text: 'Submit Order',
                          textColor: ColorData.white,
                        ),
                      ),
                    ],
                  ),
                );
              });
            },
            icon: const Icon(Icons.check));
      },
    );
  }

  Widget bottomSheetContent({required String key,
    required int index,
    required BuildContext context}) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: key),
                Row(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            color: ColorData.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                bottomLeft: Radius.circular(16.0))),
                        child: IconButton(
                            onPressed: () => cubit.add(index),
                            icon: const Icon(Icons.add))),
                    Container(
                      decoration: const BoxDecoration(
                        color: ColorData.midPurple2,
                      ),
                      height: 40.0,
                      width: 20.0,
                      child: Center(
                        child: CustomText(
                            text: cubit.itemsQuantity[index].toString(),
                            color: ColorData.white,
                            alignment: Alignment.center,
                            fontSize: 16.0),
                      ),
                    ),
                    Container(
                        decoration: const BoxDecoration(
                            color: ColorData.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0))),
                        child: IconButton(
                            onPressed: () {
                              cubit.sub(index);
                            },
                            icon: const Icon(Icons.minimize))),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 30,
            ),
          ],
        );
      },
    );
  }
}
