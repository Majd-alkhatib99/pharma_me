import 'package:flutter/material.dart';
import 'package:pharma_me/core/widgets/custom_text.dart';
import 'package:pharma_me/core/widgets/custom_textfield.dart';

class SearchLayout extends StatelessWidget {
  const SearchLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            textEditingController: TextEditingController(),
            text: '',
            hint: 'Search',
            onSave: () {},
            validator: (value) {})
      ],
    );
  }
}
