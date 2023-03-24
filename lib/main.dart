import 'package:flutter/material.dart';
import 'package:network3/pages/album_page.dart';
import 'package:network3/pages/mainView.dart';
import 'package:network3/pages/photos_pages.dart';
import 'package:network3/pages/posts_page.dart';
import 'package:network3/pages/comment_page.dart';
import 'package:network3/pages/user_page.dart';
import 'package:network3/pages2/main_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView2(),
    );
  }
}

