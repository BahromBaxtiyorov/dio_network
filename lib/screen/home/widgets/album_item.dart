

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/album_model.dart';
import '../../../pages/photos_pages.dart';

Widget albumItem(BuildContext context,AlbumModel album) {
  return SizedBox(
    height:150,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(album.userId.toString(),style: TextStyle(fontSize: 18),),
              SizedBox(height:10),
              Text(album.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return const PhotoPage();
                    }));
              },
              icon: Icon(Icons.photo))
        ],
      ),
    ),
  );
}