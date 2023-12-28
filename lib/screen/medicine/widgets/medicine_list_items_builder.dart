import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/screen/medicine/widgets/all_medicine_builder.dart';
import 'package:pharma_me/screen/medicine/widgets/cat_medicine_builder.dart';
import 'package:pharma_me/screen/medicine/widgets/category_builder.dart';

class MedicineListItemsBuilder extends StatelessWidget {
  const MedicineListItemsBuilder(
      {super.key,
      required this.medicineModelList,
      required this.medicineCat,
      required this.catIndex,
      required this.warehouseId});

  final List<MedicineModel> medicineModelList;
  final List<String> medicineCat;
  final int catIndex;
  final int warehouseId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemBuilder: (context, index) => CategoryBuilder(
                  index: index,
                  medicineCat: medicineCat,
                  selectedIndex: catIndex,
                  warehouseId: warehouseId,
                ),
                itemCount: medicineCat.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            ),
            catIndex == 0
                ? AllMedicineBuilder(
                    cubit: cubit,
                    state: state,
                  )
                : CatMedicineBuilder(
                    cubit: cubit,
                    state: state,
                  )
          ],
        );
      },
    );
  }
}





