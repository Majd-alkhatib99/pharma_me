import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/util/theme.dart';

import '../../../../core/widgets/custom_text.dart';

class HeaderRegisterBody extends StatelessWidget {
  const HeaderRegisterBody({super.key,required this.cubit});

  final dynamic cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              color: ConvertThemeMode.convertText(cubit.isDarkMode),
              text: "Register",
              fontSize: 30,
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushReplacement('/LoginScreen');
              },
              child: const CustomText(
                text: "Login",
                isBold: true,
                fontSize: 18,
                color: ColorData.grey,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}