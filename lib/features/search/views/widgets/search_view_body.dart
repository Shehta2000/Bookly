import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
