import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/widgets/custom_loading.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';
import 'package:pharma_me/screen/medicine/widgets/medicine_item_builder.dart';

class CatMedicineBuilder extends StatelessWidget {
  const CatMedicineBuilder(
      {super.key, required this.cubit, required this.state});

  final MainState state;
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: state is LoadingGetCatMedicineFromWarehouse ||
          state is LoadingGetMedicineFromWarehouse
          ? const CustomLoading()
          : cubit.medicineModelList2.isEmpty?const  Center(child: CustomText(text: 'There are no medications'),):GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: .0000002,
        childAspectRatio: 1 / .55,
        children: List.generate(
            cubit.medicineModelList2.length,
                (index) => MedicineItemBuilder(
              medicineModel: cubit.medicineModelList2[index],
            )),
      ),
    );
  }
}
