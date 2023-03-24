import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network3/pages2/user_page_details.dart';

import '../pages/userPage/user_page_album.dart';
import '../screen/home/widgets/album_item.dart';
import '../screen/home/widgets/user_item2.dart';
import '../services/album_service.dart';
import '../services/user_service.dart';

class AlbumPage_ extends StatefulWidget {
 AlbumPage_({this.id,Key? key}) : super(key: key);
int? id;
  @override
  State<AlbumPage_> createState() => _AlbumPage_State();
}

class _AlbumPage_State extends State<AlbumPage_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            child: FutureBuilder(
              // future: GetUserService.getUserByIdUser(widget.id!),
              future: GetAlbumService.getAlbum(),
              builder: (context,snapshot){
                if(snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return albumItem(context,snapshot.data![index],);
                    },
                  );
                }
                return const Center(
                  child: Text("No data"),
                );
              },
            ),
          )
      ),
    );
  }
}
