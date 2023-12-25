import 'package:flutter/material.dart';
import 'package:pharma_me/core/util/cache_serves.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key,required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(
          text: title,
          alignment: Alignment.topCenter,
          isBold: true,
          fontSize: 20),
      actions: [
        IconButton(onPressed: (){
          CacheServes.removeData(key: 'token');
        }, icon: const Icon(Icons.ac_unit))
      ],
      centerTitle: true,
    );
  }
}