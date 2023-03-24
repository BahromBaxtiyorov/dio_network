import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/home/widgets/user_item.dart';
import '../services/user_service.dart';

class UserPageDetails extends StatefulWidget {
   UserPageDetails({required this.id,Key? key}) : super(key: key);
int? id;
  @override
  State<UserPageDetails> createState() => _UserPageDetailsState();
}

class _UserPageDetailsState extends State<UserPageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Padding(
        padding:EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: GetUserService.getUserByIdUser(widget.id!),
          builder: (context,snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return userItem(context,snapshot.data![index]);
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
