import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'package:pharma_me/screen/home/layout/search_layout/widgets/search_result_list_builder.dart';

import 'widgets/search_form_field.dart';

class SearchLayout extends StatelessWidget {
  const SearchLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
          child: Column(
            children: [
              SearchFormField(
                cubit: cubit,
              ),
              const SizedBox(
                height: 10,
              ),
              SearchResultListBuilder(cubit: cubit,state: state,)
            ],
          ),
        );
      },
    );
  }
}







