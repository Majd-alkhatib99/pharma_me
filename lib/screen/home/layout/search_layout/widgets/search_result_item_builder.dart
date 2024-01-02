import 'package:flutter/material.dart';
import 'package:pharma_me/core/models/search_model.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';

class SearchResultItemBuilder extends StatelessWidget {
  const SearchResultItemBuilder({super.key, required this.searchModel});

  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: ColorData.black.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0))),
            width: double.infinity,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/categories/${searchModel.category}.jpg',
                  color: ColorData.midPurple2,
                ),
                CustomText(
                  text: searchModel.trName!,
                  alignment: Alignment.center,
                ),
                CustomText(
                  text: searchModel.quantity!.toString(),
                  alignment: Alignment.center,
                  color: ColorData.grey,
                ),
              ],
            ),
          )),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: ColorData.midPurple2,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))),
            width: double.infinity,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  content(key: 'Scientific: ', value: searchModel.scName!),
                  content(
                      key: 'Trade: ',
                      value: searchModel.trName!),
                  content(key: 'Price: ', value: searchModel.price!.toString()),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget content({required String key, required String value}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: key,fontSize: 14.0),
        CustomText(text: value, color: ColorData.white,fontSize: 14.0,),
      ],
    );
  }
}
