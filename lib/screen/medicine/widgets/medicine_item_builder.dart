import 'package:flutter/material.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';

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
                dialogContent(key: 'Trade Name:', value: medicineModel.trName!, context: context),
                dialogContent(key: 'Scientific Name:', value: medicineModel.scName!, context: context),
                dialogContent(key: 'Manufacture:', value: medicineModel.manufacturer!, context: context),
                dialogContent(key: 'Category:', value: medicineModel.category!.catName!, context: context),
                dialogContent(key: 'Quantity:', value: medicineModel.quantity.toString(), context: context),
                dialogContent(key: 'Expiration Date:', value: medicineModel.expDate!, context: context),
                dialogContent(key: 'Price:', value: medicineModel.price.toString(), context: context),
              ],
            ),
          ),
        ));
  }

  Widget dialogContent({required String key, required String value,required BuildContext context}){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: key),
            CustomText(
                text: value,
                color: ColorData.midPurple2),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
      ],
    );
  }
}

