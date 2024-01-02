import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/core/util/color_data.dart';
import 'package:pharma_me/core/widgets/custom_text_field.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({super.key, required this.cubit});

  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        icon: const Icon(Icons.search),
        onChanged: (String keyword) =>
            cubit.searchMedicines(keyword: keyword),
        textColor: ColorData.black,
        textEditingController: cubit.searchController,
        text: '',
        hint: 'Search',
        onSave: () {},
        validator: (value) {return null;});
  }
}