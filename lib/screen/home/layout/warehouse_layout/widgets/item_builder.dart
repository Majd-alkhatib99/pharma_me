import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';
import 'package:pharma_me/screen/medicine/medicine_screen.dart';

class ItemBuilder extends StatelessWidget {
  const ItemBuilder({super.key, required this.cubit, required this.index});

  final int index;
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorData.midPurple,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: .5,
                blurRadius: 5,
                offset: Offset(0, .2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(16.0)),
        width: double.infinity,
        height: 75,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: (){
              // todo: implement navigator
              cubit.getMedicineFromWarehouse(warehouseId: index);
              // GoRouter.of(context).push('/MedicineScreen');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineScreen(appBarTitle: cubit.warehouseModel[index].name!,medicineModelList: cubit.medicineModelList,warehouseId: cubit.warehouseModel[index].id!)));
            },
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: ColorData.white,
                  child: Icon(
                    Icons.person,
                    size: 45,
                    color: ColorData.midPurple,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                CustomText(
                  text: cubit.warehouseModel[index].name!,
                  alignment: Alignment.center,
                  color: ColorData.white,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorData.white,
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}