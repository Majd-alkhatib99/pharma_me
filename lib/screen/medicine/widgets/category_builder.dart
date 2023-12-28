import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder(
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