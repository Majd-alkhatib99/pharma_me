import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'custom_text.dart';

class CustomTextFormField  extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSave;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Widget? icon;
  final Color textColor;
  final Color color;
  final Color primeColor;
  final bool enabled;

  const CustomTextFormField ({
    Key? key,
    this.textColor=ColorData.white,
    this.color=ColorData.grey,
    this.primeColor=ColorData.midPurple2,
    this.icon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    required this.textEditingController,
    required  this.text,
    required this.hint,
    required this.onSave,
    required this.validator,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: textColor,
        ),
        TextFormField(
          enabled: enabled,
          obscureText: obscureText,
          controller: textEditingController,
          keyboardType: textInputType,
          style:  GoogleFonts.ubuntu(
            textStyle: TextStyle(
                color: textColor
            ),
          ),
          validator:validator,
          onSaved: (value) => onSave(),
          decoration: InputDecoration(
            suffixIcon: icon,
            hintText: hint,
            hintStyle:  TextStyle(
              color:color,
            ),
            fillColor: Colors.white,
            disabledBorder:  UnderlineInputBorder(
                borderSide: BorderSide(color: color),
    ),
            border:  UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),

            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
            focusedBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color: primeColor),
            ),

          ),
        )
      ],
    );
  }
}