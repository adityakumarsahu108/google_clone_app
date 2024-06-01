import 'package:flutter/material.dart';
import 'package:google_clone_app/colors.dart';

class SearchButtons extends StatelessWidget {
  final String title;
  const SearchButtons({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      color: searchColor,
      child: Text(title),
    );
  }
}
