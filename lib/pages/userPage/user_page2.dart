import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network3/pages/userPage/user_page_byId.dart';

import '../../screen/home/widgets/user_item2.dart';
import '../../services/user_service.dart';

class UserPage2 extends StatefulWidget {
  const UserPage2({Key? key}) : super(key: key);

  @override
  State<UserPage2> createState() => _UserPage2State();
}

class _UserPage2State extends State<UserPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User page")),
       body: Padding(
          padding:EdgeInsets.symmetric(horizontal: 5),
          child: FutureBuilder(
            future: GetUserService.getUser(),
            builder: (context,snapshot){
              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    return InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return UserPageByID(id:snapshot.data![index].id);
                                }));
                          },
                        child: userItem2(snapshot.data![index],));
                  },
                );
              }
              return const Center(
                child: Text("No data"),
              );
            },
          ),
        )
    );
  }
}
