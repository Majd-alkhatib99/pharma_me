import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';

class MedicineItemBuilder extends StatelessWidget {
  const MedicineItemBuilder(
      {super.key, required this.medicineModel, required this.index});

  final MedicineModel medicineModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: Stack(
            children: [
              InkWell(
                onTap: () => showMedicineDetailsDialog(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorData.midPurple2, width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorData.midPurple2,
                        spreadRadius: .5,
                        blurRadius: 5,
                        offset: Offset(0, .2), // changes position of shadow
                      ),
                    ],
                    color: ColorData.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  width: MediaQuery.of(context).size.width * .40,
                  height: MediaQuery.of(context).size.width * .25,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 6.0, bottom: 2.0, left: 8.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.width * .045,
                            backgroundColor: ColorData.black.withOpacity(0.2),
                            child: Image(
                              image: AssetImage(
                                medicineModel.category != null
                                    ? 'assets/images/${medicineModel.category!.image}'
                                    : 'assets/images/categories/injections.jpg',
                              ),
                              width: MediaQuery.of(context).size.width * .060,
                            )),
                        const SizedBox(
                          height: 5.0,
                        ),
                        CustomText(
                          text: medicineModel.scName!,
                          alignment: Alignment.center,
                          color: ColorData.black,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                text: medicineModel.category != null
                                    ? medicineModel.category!.catName!
                                    : '?Name',
                                color: ColorData.black.withOpacity(0.6)),
                            CustomText(
                                text: medicineModel.quantity.toString(),
                                color: ColorData.black.withOpacity(0.6)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              cubit.catIndex == 0
                  ? Checkbox(
                      value: cubit.checkBoxValue[index],
                      onChanged: (value) =>
                          cubit.changeCheckBoxState(value!, index),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> showMedicineDetailsDialog(context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Details:',
                    color: ColorData.midPurple2,
                    isBold: true,
                    fontSize: 18,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: ColorData.midPurple,
                    ),
                  )
                ],
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(
                  children: [
                    dialogContent(
                        key: 'Trade Name:',
                        value: medicineModel.trName!,
                        context: context),
                    dialogContent(
                        key: 'Scientific Name:',
                        value: medicineModel.scName!,
                        context: context),
                    dialogContent(
                        key: 'Manufacture:',
                        value: medicineModel.manufacturer!,
                        context: context),
                    dialogContent(
                        key: 'Category:',
                        value: medicineModel.category!.catName!,
                        context: context),
                    dialogContent(
                        key: 'Quantity:',
                        value: medicineModel.quantity.toString(),
                        context: context),
                    dialogContent(
                        key: 'Expiration Date:',
                        value: medicineModel.expDate!,
                        context: context),
                    dialogContent(
                        key: 'Price:',
                        value: medicineModel.price.toString(),
                        context: context),
                  ],
                ),
              ),
            ));
  }

  Widget dialogContent(
      {required String key,
      required String value,
      required BuildContext context}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: key),
            CustomText(text: value, color: ColorData.midPurple2),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
      ],
    );
  }
}
