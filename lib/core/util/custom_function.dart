import 'package:flutter/material.dart';
import 'package:pharma_me/core/util/theme.dart';

class CustomFunction{
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar ({required String message,required context,required bool mode}){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.fixed,
      content: Text(message),
      backgroundColor: ConvertThemeMode.convertPrimeColor(mode),
    ));
  }
}
