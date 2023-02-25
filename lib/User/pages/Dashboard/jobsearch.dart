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

/*
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  List<String> _listItems = List.generate(100, (index) => "Item $index");

  List<String> _filteredItems = [];

  @override
  void initState() {
    _filteredItems.addAll(_listItems);
    super.initState();
  }

  void _filterList(String searchText) {
    setState(() {
      _filteredItems = _listItems
          .where((item) =>
              item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: TextField(
          controller: _searchController,
          onChanged: (value) {
            _filterList(value);
          },
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.purple),
            prefixIcon: Icon(Icons.search, color: Colors.purple),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.purple),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredItems[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(details: _filteredItems[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String details;

  const DetailsPage({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(details)),
      body: Center(child: Text(details)),
    );
  }
}*/
/*
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

final List<String> titleList = [
  "Title 1",
  "Title 2",
  "Title 3",
  // add more titles as needed
];

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  late List<String> _listItems;
  List<String> _filteredItems = [];
  List<String> _initListItems() {
    List<String> titleList = [
      "Title 1",
      "Title 2",
      "Title 3",
      "Title 4",
      "Title 5",
      "Title 6",
      "Title 7",
      "Title 8",
      "Title 9",
      "Title 10",
      "Title 11",
      "Title 12"
      "Title 13",
      "Title 14",
      "Title 15",
      "Title 16",
      "Title 17",
      "Title 18",
      "Title 19",
      "Title 20",
      "Title 21",
      "Title 22",
      "Title 23",
      "Title 24",
      "Title 25",
      "Title 26",
      "Title 27",
      "Title 28",
      "Title 29",
      "Title 30",
      "Title 31",
      "Title 32",
      "Title 33",
      "Title 34",
      "Title 35",
      "Title 36",
      "Title 37",
    ];
    return List.generate(titleList.length, (index) => titleList[index]);
  }

  @override
  void initState() {
    _filteredItems.addAll(_listItems);
    _listItems = _initListItems();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterList(String searchText) {
    setState(() {
      _filteredItems = _listItems
          .where(
              (item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: (value) {
            _filterList(value);
          },
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.black),
            prefixIcon: Icon(Icons.search, color: Colors.black),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _filteredItems[index],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Subtitle for ${_filteredItems[index]}',
              style: TextStyle(fontSize: 14.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(details: _filteredItems[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String details;

  const DetailsPage({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(details),
        // automaticallyImplyLeading: false,
      ),
      body: Center(child: Text(details)),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<String> _listItems;
  final TextEditingController _searchController = TextEditingController();

  List<String> _initListItems() {
    List<String> titleList = [
      "Title 1",
      "Title 2",
      "Title 3",
      // add more titles as needed
    ];
    return List.generate(titleList.length, (index) => titleList[index]);
  }

  @override
  void initState() {
    super.initState();
    _listItems = _initListItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              setState(() {});
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _listItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              _listItems[index],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Subtitle for ${_listItems[index]}',
              style: TextStyle(fontSize: 14.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(details: _listItems[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}*/



class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<String> _listItems;
  final TextEditingController _searchController = TextEditingController();

  List<String> _initListItems() {
    List<String> titleList = [
      "Title 1",
      "Title 2",
      "Title 3",
      // add more titles as needed
    ];
    // List<String> subtitleList = [
    //   "subTitle 1",
    //   "subTitle 2",
    //   "subTitle 3",
    //   // add more titles as needed
    // ];
    return List.generate(titleList.length, (index) => titleList[index]);
  }

  @override
  void initState() {
    super.initState();
    _listItems = _initListItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> _searchList = _listItems.where((item) =>
        item.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              setState(() {});
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _searchList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              _searchList[index],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Subtitle for ${_searchList[index]}',
              style: TextStyle(fontSize: 14.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(details: _searchList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String details;

  const DetailsPage({required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(details),
      ),
      body: Center(
        child: Text(details),
      ),
    );
  }
}

