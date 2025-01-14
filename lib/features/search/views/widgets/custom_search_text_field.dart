import 'package:bookly_app/features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = SearchCubit.get(context);

    return TextField(
      controller: searchCubit.searchController,
      onEditingComplete: () {
        if (searchCubit.searchController.text.isNotEmpty) {
          searchCubit.fetchSearchBooks(
            bookName: searchCubit.searchController.text,
          );
        }
      },
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: borderShape(),
        enabledBorder: borderShape(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            if (searchCubit.searchController.text.isNotEmpty) {
              searchCubit.fetchSearchBooks(
                bookName: searchCubit.searchController.text,
              );
            }
          },
          icon: const Opacity(
            opacity: 0.8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder borderShape() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
