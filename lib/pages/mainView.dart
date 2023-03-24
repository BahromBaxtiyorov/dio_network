import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network3/pages/photos_pages.dart';
import 'package:network3/pages/posts_page.dart';
import 'package:network3/pages/user_page.dart';
import 'package:network3/pages/userPage/user_page2.dart';

import 'album_page.dart';
import 'comment_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return UserPage();
                }));
          },
              child: Center(child: Text("User page",style: TextStyle(fontSize:20)))),
          SizedBox(height:5),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return UserPage2();
                }));
          },
              child: Center(child: Text("User page2",style: TextStyle(fontSize:20)))),
          SizedBox(height:5),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return PostPage();
                }));
          },
              child: Center(child: Text("Post page",style: TextStyle(fontSize:20)))),
          SizedBox(height:5),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return PhotoPage();
                }));
          },
              child: Center(child: Text("Photo page",style: TextStyle(fontSize:20)))),
          SizedBox(height:5),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return CommentPage();
                }));
          },
              child: Center(child: Text("Comment page",style: TextStyle(fontSize:20)))),
          SizedBox(height:5),
          ElevatedButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return AlbumPage();
                }));
          },
              child: Center(child: Text("Album page",style: TextStyle(fontSize:20)))),
        ],
      )
    );
  }
}
