import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../model/album_model.dart';
import '../../../model/user_model.dart';

Widget userItem2(UserModel user2) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       Center(child: Text(user2.name,style: TextStyle(fontSize: 20,color: Colors.blue),)),
     ],
    ),
  );
}
