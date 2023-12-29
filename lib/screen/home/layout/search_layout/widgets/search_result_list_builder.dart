import 'package:flutter/material.dart';
import 'package:pharma_me/core/manager/main_cubit/main_cubit.dart';
import 'search_result_item_builder.dart';

class SearchResultListBuilder extends StatelessWidget {
  const SearchResultListBuilder(
      {super.key, required this.cubit, required this.state});

  final MainCubit cubit;
  final MainState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: state is LoadingSearchState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => SearchResultItemBuilder(
                    searchModel: cubit.searchModel[index]),
                itemCount: cubit.searchModel.length,
              ));
  }
}
