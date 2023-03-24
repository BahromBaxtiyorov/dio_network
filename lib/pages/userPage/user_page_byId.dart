import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network3/pages/posts_page.dart';
import 'package:network3/pages/userPage/user_page_album.dart';
import 'package:network3/pages/userPage/user_page_post.dart';

import '../album_page.dart';

class UserPageByID extends StatefulWidget {
  UserPageByID({ this.id,Key? key}) : super(key: key);

  int? id;
  @override
  State<UserPageByID> createState() => _UserPageByIDState();
}

class _UserPageByIDState extends State<UserPageByID>with SingleTickerProviderStateMixin {
late TabController _tabController;

@override
void initState() {
  _tabController = TabController(length: 2, vsync: this);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User page"),
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 18, color: Colors.blue),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(text: "Posts",),
            Tab(text: "Albums",),
          ],),
      ),
        body: TabBarView(
          controller: _tabController,
          children: [
            UserPagePosts(id: widget.id,),
            UserAlbumPage(id: widget.id,),
          ],
        )
    );
  }
}
