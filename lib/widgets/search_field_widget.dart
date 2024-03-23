import 'package:flutter/material.dart';
import 'package:sigma/utils/color_util.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.hint,
    required this.searchController,
    this.searchTap,
    this.cleanTap,
    this.onTap,
  });

  final String hint;
  final TextEditingController searchController;
  final void Function()? searchTap;
  final void Function()? cleanTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 10, right: 5, left: 0),
      child: TextFormField(
        onTap: onTap,
        textAlign: TextAlign.left,
        cursorColor: ColorUtil.primaryAccent,
        controller: searchController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: InkWell(
            onTap: searchTap,
            child: const Icon(Icons.search,
                color: ColorUtil.primaryAccent, size: 28),
          ),
          suffixIcon: InkWell(
            onTap: cleanTap,
            child: const Icon(Icons.delete, color: ColorUtil.gray, size: 5),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: ColorUtil.primaryAccent,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: ColorUtil.primaryAccent,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: ColorUtil.primaryAccent,
              width: 1.5,
            ),
          ),
        ),
        onEditingComplete: searchTap,
        onFieldSubmitted: (String value) {},
      ),
    );
  }
}
