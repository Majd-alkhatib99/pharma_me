import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen(
      {super.key, required this.appBarTitle, required this.medicineModelList});

  final String appBarTitle;
  final List<MedicineModel> medicineModelList;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,

              title: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(width: 5,),
                  CustomText(
                      text: '$appBarTitle Warehouse', isBold: true, fontSize: 18,),
                ],
              ),
            ),
            body: state is LoadingGetMedicineFromWarehouse
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : medicineModelList.isEmpty
                    ? const Center(
                        child: CustomText(
                          text: 'is empty',
                          alignment: Alignment.center,
                        ),
                      )
                    : MedicineListItemsBuilder(
                        medicineModelList: medicineModelList,
                      ));
      },
    );
  }
}

class MedicineItemBuilder extends StatelessWidget {
  const MedicineItemBuilder({super.key, required this.medicineModel});

  final MedicineModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      child: InkWell(
        onTap: () => showMedicineDetailsDialog(context),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: .5,
                blurRadius: 5,
                offset: Offset(0, .2), // changes position of shadow
              ),
            ],
            color: ColorData.midPurple2,
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
                    backgroundColor: ColorData.white,
                    child: Image(
                      image: AssetImage(
                        'assets/images/${medicineModel.category!.image}',
                      ),
                      width: MediaQuery.of(context).size.width * .060,
                    )),
                const SizedBox(
                  height: 5.0,
                ),
                CustomText(
                  text: medicineModel.scName!,
                  alignment: Alignment.center,
                  color: ColorData.white,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: medicineModel.category!.catName!,
                        color: ColorData.white.withOpacity(0.6)),
                    CustomText(
                        text: medicineModel.quantity.toString(),
                        color: ColorData.white.withOpacity(0.6)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: 'Trade Name:'),
                        CustomText(
                            text: medicineModel.trName!,
                            color: ColorData.midPurple2),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: 'Scientific Name:'),
                        CustomText(
                            text: medicineModel.scName!,
                            color: ColorData.midPurple2),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: 'Manufacture:'),
                        CustomText(
                            text: medicineModel.manufacturer!,
                            color: ColorData.midPurple2),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: 'Category:'),
                        CustomText(
                            text: medicineModel.category!.catName!,
                            color: ColorData.midPurple2),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: 'Quantity:'),
                        CustomText(
                            text: medicineModel.quantity.toString(),
                            color: ColorData.midPurple2),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: 'Expiration Date:'),
                        CustomText(
                            text: medicineModel.expDate!,
                            color: ColorData.midPurple2),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: 'Price:'),
                        CustomText(
                            text: medicineModel.price.toString(),
                            color: ColorData.midPurple2),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}

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
