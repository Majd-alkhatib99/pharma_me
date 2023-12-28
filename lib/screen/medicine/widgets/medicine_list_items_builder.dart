import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';
import 'medicine_item_builder.dart';

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
                itemBuilder: (context, index) => BuildCategory(
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
            Expanded(
                    flex: 12,
                    child: state is LoadingGetCatMedicineFromWarehouse || state is LoadingGetMedicineFromWarehouse
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        :GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: .0000002,
                      childAspectRatio: 1 / .55,
                      children: List.generate(
                          cubit.medicineModelList.length,
                          (index) => MedicineItemBuilder(
                                medicineModel: cubit.medicineModelList[index],
                              )),
                    ),
                  )
          ],
        );
      },
    );
  }
}

class BuildCategory extends StatelessWidget {
  const BuildCategory(
      {super.key,
      required this.index,
      required this.medicineCat,
      required this.selectedIndex,
      required this.warehouseId});

  final int index;
  final List<String> medicineCat;
  final int selectedIndex;
  final int warehouseId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Container(
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(color: ColorData.midPurple2),
            borderRadius: BorderRadius.circular(16.0),
            color: selectedIndex == index
                ? ColorData.midPurple2
                : Colors.transparent),
        child: InkWell(
          onTap: () => MainCubit.get(context)
              .changeCatIndex(warehouseId: warehouseId, catIndex: index),
          child: CustomText(
            alignment: Alignment.center,
            text: medicineCat[index],
            color: selectedIndex == index ? ColorData.white : ColorData.black,
          ),
        ),
      ),
    );
  }
}
