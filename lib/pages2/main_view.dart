import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network3/pages2/post_page.dart';
import 'package:network3/pages2/user_page_.dart';

import '../pages/album_page.dart';
import '../pages/posts_page.dart';
import '../pages/userPage/user_page_album.dart';
import 'album_page_.dart';

class MainView2 extends StatefulWidget {
   MainView2({this.id,Key? key}) : super(key: key);
 int? id;

  @override
  State<MainView2> createState() => _MainView2State();
}

class _MainView2State extends State<MainView2>with SingleTickerProviderStateMixin  {
  // var son = widget!.id;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  // var _pages = [
  //   UserPage_(id: widget.id),
  //   UserAlbumPage(),
  //   UserPage_(),
  // ];
  int currentPage =0;
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: _pages[currentPage],
    //   bottomNavigationBar: BottomNavigationBar(
    //     currentIndex: currentPage,
    //     onTap: (i){
    //       setState(() {
    //         currentPage = i;
    //       });
    //     },
    //     type: BottomNavigationBarType.fixed,
    //     showSelectedLabels: false,
    //     showUnselectedLabels: false,
    //     selectedItemColor: Colors.black,
    //     items: [
    //       BottomNavigationBarItem(icon: Icon(Icons.post_add),label: "Posts"),
    //       BottomNavigationBarItem(icon: Icon(Icons.search),label: "Users"),
    //       BottomNavigationBarItem(icon: Icon(Icons.photo_album_outlined),label: "Albums"),
    //     ],
    //   ),
    // );

    return Scaffold(
        appBar: AppBar(title: Text("Pages"),
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 18, color: Colors.blue),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(text: "Posts",),
              Tab(text: "Users",),
              Tab(text: "Albums",),
            ],),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            const PostPage2(),
            UserPage_(id: widget.id),
            const AlbumPage(),
            //AlbumPage_(id: widget.id),
             // UserAlbumPage(id: widget.id),
          ],
        )
    );
  }
}
