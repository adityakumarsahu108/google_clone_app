import 'package:flutter/material.dart';
import 'package:google_clone_app/widgets/search_header.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //web header
            SearchHeader(),
            //tabs for new images etc
            //search results
            //next prev buttons
          ],
        ),
      ),
    );
  }
}
