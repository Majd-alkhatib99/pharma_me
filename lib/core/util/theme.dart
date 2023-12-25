import 'package:flutter/material.dart';
import 'package:pharma_me/core/util/color_data.dart';

class ConvertThemeMode {

  static Color convertPrimeColor(bool mode){
    if(mode) {
      return ColorData.midPurple2;
    } else {
      return ColorData.midPurple2;
    }
  }

  static Color convertText(bool mode){
    if(mode) {
      return ColorData.white;
    } else {
      return ColorData.black;
    }
  }

  static Color convertBackground(bool mode){
    if(mode) {
      return ColorData.white;
    } else {
      return ColorData.grey;
    }
  }

}