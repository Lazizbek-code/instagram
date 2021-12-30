import 'package:flutter/material.dart';
import 'feed_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  var pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        title: Text("Instagram", style: TextStyle(color: Colors.black), ),  
        leading: IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          color: Colors.black,
          onPressed: () {
            
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.tv),
            color: Colors.black,
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.send_rounded),
            color: Colors.black,
            onPressed: () {
              
            },
          ),
        ],

      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap:(i){
          setState(() {
            currentPage = i;
          });
        },
        type:BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            title: Text("Upload"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            title: Text("Likes"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Account"),
          )
        ],
      ),
      
    );
  }
}