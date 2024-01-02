import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/models/orders_model.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';

class OrderItemBuilder extends StatelessWidget {
  const OrderItemBuilder(
      {super.key, required this.orderModel, required this.cubit});

  final OrdersModel orderModel;
  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
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
        ),
        height: MediaQuery.of(context).size.height * .2,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * .1,
              child: Lottie.asset(orderModel.image!),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .06,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .004,
                ),
                Row(
                  children: [
                    const CustomText(text: 'Created at:'),
                    const SizedBox(
                      width: 5.0,
                    ),
                    CustomText(
                      text: DateFormat.yMd()
                          .format(DateTime.parse(orderModel.createdAt!)),
                      color: ColorData.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CustomText(text: 'Status:'),
                    const SizedBox(
                      width: 5.0,
                    ),
                    CustomText(
                      text: orderModel.status!,
                      color: ColorData.grey,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: 'Payment Status:',
                      alignment: Alignment.center,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    CustomText(
                      text: orderModel.paymentStatus!,
                      alignment: Alignment.center,
                      color: ColorData.grey,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .004),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),

          ],
        ),
      ),
    );
  }
}