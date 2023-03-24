import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network3/pages/user_name_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Navigator.pushNamed(context,"/ContactProfil");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return NamePage();
                    }));
              }, child: Center(child: Text("Name",style: TextStyle(fontSize: 25),)),

          )
        ],
      )
    );
  }
}
