import 'package:flutter/material.dart';

class JobSearch extends StatelessWidget {
  const JobSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Search"),
      ),
      body: SearchPage(),
    );
  }
}

class SearchData {
  final int vid;
  final String title;
  final String subtitle;
  final String description;

  SearchData(this.vid, this.title, this.subtitle, this.description);
}

final List<SearchData> searchDataList = [
  SearchData(1, 'Title 1', 'Subtitle 1', 'Description 1'),
  SearchData(2, 'Title 2', 'Subtitle 2', 'Description 2'),
  SearchData(3, 'Title 3', 'Subtitle 3', 'Description 3'),
];

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredList = searchText.isEmpty ? searchDataList : searchDataList.where((searchData) =>
        searchData.title.toLowerCase().contains(searchText.toLowerCase()) ||
        searchData.subtitle.toLowerCase().contains(searchText.toLowerCase()) ||
        searchData.description.toLowerCase().contains(searchText.toLowerCase())).toList();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Search'),
      // ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
              onChanged: (text) {
                setState(() {
                  searchText = text;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                final searchData = filteredList[index];
                return ListTile(
                  title: Text(searchData.title),
                  subtitle: Text(searchData.subtitle),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage(searchData: searchData)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final SearchData searchData;

  const DetailsPage({Key? key, required this.searchData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchData.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(searchData.subtitle),
            Text(searchData.description),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}


