import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/home/widgets/user_item.dart';
import '../services/user_service.dart';

class NamePage extends StatefulWidget {
   NamePage({ Key? key}) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: GetUserService.getUser(),
          builder: (context,snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return userItem(context,snapshot.data![index],);
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
