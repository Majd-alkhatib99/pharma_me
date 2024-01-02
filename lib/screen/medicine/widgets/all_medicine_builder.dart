import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/widgets/custom_loading.dart';
import 'package:pharma_me/screen/medicine/widgets/medicine_item_builder.dart';

class AllMedicineBuilder extends StatelessWidget {
  const AllMedicineBuilder(
      {super.key, required this.state, required this.cubit});

  final MainState state;
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: state is LoadingGetCatMedicineFromWarehouse ||
          state is LoadingGetMedicineFromWarehouse
          ? const CustomLoading()
          : GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: .0000002,
        childAspectRatio: 1 / .55,
        children: List.generate(
            cubit.medicineModelList.length,
                (index) => MedicineItemBuilder(
              medicineModel: cubit.medicineModelList[index],
                  index: index,
            )),
      ),
    );
  }
}