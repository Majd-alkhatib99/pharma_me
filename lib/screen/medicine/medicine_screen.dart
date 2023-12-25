import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/models/medicine_model.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';
import 'widgets/medicine_list_items_builder.dart';

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




