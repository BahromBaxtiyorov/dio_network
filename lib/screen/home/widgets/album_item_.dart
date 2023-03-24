import 'package:flutter/cupertino.dart';

import '../../../model/album_model.dart';

Widget albumItem(AlbumModel album){
  return SizedBox(
    height:150,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(album.userId.toString(),style: TextStyle(fontSize: 18),),
          SizedBox(height:10),
          Text(album.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    ),
  );
}