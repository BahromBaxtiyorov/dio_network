import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/home/widgets/album_item.dart';
import '../services/album_service.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetAlbumService;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Albums")),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: GetAlbumService.getAlbum(),
          builder: (context,snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return albumItem(context,snapshot.data![index]);
                },
              );
            }
            return const Center(
              child: Text("No data"),
            );
          },
        ),
      ),
    );
  }
}
