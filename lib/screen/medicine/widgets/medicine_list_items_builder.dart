import 'package:flutter/material.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'medicine_item_builder.dart';

class MedicineListItemsBuilder extends StatelessWidget {
  const MedicineListItemsBuilder({super.key, required this.medicineModelList});

  final List<MedicineModel> medicineModelList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: .0000002,
      childAspectRatio: 1 / .55,
      children: List.generate(
          medicineModelList.length,
              (index) => MedicineItemBuilder(
            medicineModel: medicineModelList[index],
          )),
    );
  }
}