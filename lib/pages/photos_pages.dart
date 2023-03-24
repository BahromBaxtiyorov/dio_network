import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network3/services/photo_service.dart';

import '../screen/home/widgets/photo_item.dart';



class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPhotoService;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("Photos")),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: GetPhotoService.getPhoto(),
          builder: (context,snapshot){
            if(snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context,index){
                  return photoItem(snapshot.data![index]);
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
