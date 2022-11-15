// @dart=2.9;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/details.dart';
import 'package:news_app/listwidget.dart';
import 'package:news_app/shared/listitem.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {


late List<ListItem>  listTiles = [
  ListItem(
    "https://images.unsplash.com/photo-1600703136783-bdb5ea365239?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dW5pcXVlJTIwZmxvd2VyfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
       lipsum.createWord(numWords :2),
       lipsum.createWord(numWords: 1),
        "28 Jan 2022 ",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1490709435980-c21448027a87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dW5pcXVlJTIwZmxvd2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    lipsum.createWord(numWords : 2),
    lipsum.createWord(numWords: 1),
    "28 Jan 2022 ",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1620142828449-203a4979d9c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8dW5pcXVlJTIwZmxvd2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    lipsum.createWord(numWords : 2),
    lipsum.createWord(numWords: 1),
    "28 Jan 2022 ",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1563866769937-28619344db65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHVuaXF1ZSUyMGZsb3dlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    lipsum.createWord(numWords : 2),
    lipsum.createWord(numWords:1),
    "28 Jan 2022 ",
  ),
  ListItem(
    "https://images.unsplash.com/photo-1541143011610-fe5c3458686e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHVuaXF1ZSUyMGZsb3dlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    lipsum.createWord(numWords : 2),
    lipsum.createWord(numWords:1),
    "28 Jan 2022 ",
  ),
];


 late List<Tab> _tabList = [
    Tab(
      child: Text("Top"),
    ),
    Tab(
      child: Text("Popular"),
    ),
    Tab(
      child: Text("Trending"),
    ),
    Tab(
      child: Text("Editor choise"),
    ),
    Tab(
      child: Text("Category"),
    ),
  ];

  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xFFFAFAFA),
          centerTitle: true,
          title: Text(
            'News App',
            style: TextStyle(color: Colors.black),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: TabBar(
              indicatorColor: Colors.black,
              isScrollable: true,
              labelColor: Colors.black,
              controller: _tabController,
              tabs: _tabList,
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: EdgeInsets.all(8),

              child: Container(

                child: ListView.builder(
                  itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> DetailsScreen
                          (item: listTiles[index],
                            tag: listTiles[index].newsTitle,
                        )));

                    },
                    child: listWidget(listTiles[index]),
                  ) ;
                },
                ),
              ),
              ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(),
            ),
          ],
        ));
  }
}
