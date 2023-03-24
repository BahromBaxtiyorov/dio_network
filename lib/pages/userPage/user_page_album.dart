import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screen/home/widgets/album_item.dart';
import '../../services/user_service.dart';

class UserAlbumPage extends StatefulWidget {
  UserAlbumPage({this.id,Key? key}) : super(key: key);
int? id;
  @override
  State<UserAlbumPage> createState() => _UserAlbumPageState();
}

class _UserAlbumPageState extends State<UserAlbumPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserService;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  Padding(
        padding:EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: GetUserService.getUserByIdAlbum(widget.id!),
          builder: (context,snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return albumItem(context,snapshot.data![index]);
                },
              );}
            return const Center(
              child: Text("No data"),
            );
          },
        ),
      ),
    );
  }
}
