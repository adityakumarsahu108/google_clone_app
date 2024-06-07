import 'package:flutter/material.dart';
import 'package:google_clone_app/colors.dart';
import 'package:google_clone_app/services/api_service.dart';
import 'package:google_clone_app/widgets/search_footer.dart';
import 'package:google_clone_app/widgets/search_header.dart';
import 'package:google_clone_app/widgets/search_result_component.dart';
import 'package:google_clone_app/widgets/web/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen(
      {super.key, required this.searchQuery, required this.start});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      title: searchQuery,
      color: Colors.blue,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //web header
              const SearchHeader(),
              //tabs for new images etc
              Padding(
                padding: EdgeInsets.only(left: size.width <= 768 ? 10 : 150.0),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SearchTabs(),
                ),
              ),
              const Divider(
                height: 0,
                thickness: 0.3,
              ),
              //search results
              FutureBuilder(
                future: ApiService().fetchData(
                  queryTerm: searchQuery,
                  start: start,
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.width <= 768 ? 10 : 150, top: 12),
                              child: Text(
                                'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']}  seconds)',
                                style: const TextStyle(
                                    fontSize: 15, color: Color(0xFF70757a)),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                            itemCount: snapshot.data?['items'].length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: size.width <= 768 ? 10 : 150,
                                    top: 10),
                                child: SearchResultComponent(
                                  desc: snapshot.data?['items'][index]
                                      ['snippet'],
                                  link: snapshot.data?['items'][index]
                                      ['formattedUrl'],
                                  linkToGo: snapshot.data?['items'][index]
                                      ['link'],
                                  text: snapshot.data?['items'][index]['title'],
                                ),
                              );
                            }),
                        //next prev buttons
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (start != "0") {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: ((context) => SearchScreen(
                                              searchQuery: searchQuery,
                                              start: (int.parse(start) - 10)
                                                  .toString(),
                                            )),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  '< Prev',
                                  style:
                                      TextStyle(fontSize: 15, color: blueColor),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) => SearchScreen(
                                            searchQuery: searchQuery,
                                            start: (int.parse(start) + 10)
                                                .toString(),
                                          )),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Next >',
                                  style:
                                      TextStyle(fontSize: 15, color: blueColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const SearchFooter(),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
