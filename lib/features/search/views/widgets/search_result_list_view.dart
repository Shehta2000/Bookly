import 'package:flutter/material.dart';

import '../../../home/presentation/views/widgets/bestseller_list_view.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return  const  Padding(
            padding:   EdgeInsets.symmetric(vertical: 10),
            // child: BookListViewItem(
              
            // ),
            child: Text(''),
          );
        });
  }
}
