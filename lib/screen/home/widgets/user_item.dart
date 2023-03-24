import 'package:flutter/material.dart';
import 'package:network3/model/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

Widget userItem(BuildContext context,UserModel user){
  return Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height:10),
        Text("name: ${user.name}",style: TextStyle(fontSize: 18)),
        Divider(thickness: 1,color: Colors.grey),
        SizedBox(height:10),
        Text("username: ${user.username}",style: TextStyle(fontSize: 18)),
        Divider(thickness: 1,color: Colors.grey),
        SizedBox(height:10),
        Text("email: ${user.email}",style: TextStyle(fontSize: 18)),
        Divider(thickness: 1,color: Colors.grey),
        SizedBox(height:10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
         child: Text("Address: ${user.address.city} ${user.address.street} ${user.address.suite}",
           style: TextStyle(fontSize: 16),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,),),
        SizedBox(height:5),
        Text(user.address.zipcode,style: TextStyle(fontSize: 16)),
        Divider(thickness: 1,color: Colors.grey),
        SizedBox(height:10),
        Text("geo: ${user.address.geo.lat}${user.address.geo.lng}",style: TextStyle(fontSize: 18)),
        Divider(thickness: 1,color: Colors.grey),
        SizedBox(height:10),
        InkWell(
            onTap: ()async{
              launchUrl(Uri.parse("${user.phone}"));
            },
            child: Text("phone: ${user.phone}",style: TextStyle(fontSize: 18))),
        Divider(thickness: 1,color: Colors.grey),
        SizedBox(height:10),
        InkWell(
            onTap: ()async {
              launchUrl(Uri.parse("${user.website}"),
                  mode:LaunchMode.externalApplication);},
            child: Text("website: ${user.website}",style: TextStyle(fontSize: 18))),
        Divider(thickness: 1,color: Colors.grey),
        SizedBox(height:10),
        Text("Company: ${user.company.name}",style: TextStyle(fontSize: 18)),
        SizedBox(height:5),
        Text(user.company.catchPhrase,style: TextStyle(fontSize: 18)),
        SizedBox(height:5),
        Text(user.company.bs,style: TextStyle(fontSize: 18)),
        SizedBox(height:10),
        Divider(thickness: 5,color: Colors.grey),
      ],
    )
  );
}