import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network3/pages2/user_page_details.dart';

import '../pages/user_name_page.dart';
import '../pages/userPage/user_page_byId.dart';
import '../screen/home/widgets/user_item2.dart';
import '../services/user_service.dart';

// class UserPage_ extends StatefulWidget {
//   UserPage_({Key? key}) : super(key: key);
//
//   @override
//   State<UserPage_> createState() => _UserPage_State();
// }
//
// class _UserPage_State extends State<UserPage_> {
//   var controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: controller,
//               keyboardType: TextInputType.name,
//               decoration: InputDecoration(
//                labelText: "Search user",
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blue,
//                       )
//                   ),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide()
//                   )
//               ),
//             ),
//             SizedBox(height:20),
//             FutureBuilder(
//               // future: GetUserService.getUserByIdUSer(widget.id!),
//               future: GetUserService.getUser(),
//               builder: (context,snapshot){
//                 if(snapshot.hasData) {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context,index){
//                       return userItem2(snapshot.data![index],);
//                     },
//                   );
//                 }
//                 return const Center(
//                   child: Text("No data"),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



class UserPage_ extends StatefulWidget {
  UserPage_({this.id,Key? key}) : super(key: key);
int? id;
  @override
  State<UserPage_> createState() => _UserPage_State();
}

class _UserPage_State extends State<UserPage_> {
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // TextFormField(
            //   controller: controller,
            //   keyboardType: TextInputType.name,
            //   decoration: InputDecoration(
            //       labelText: "Search user",
            //       focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.blue,
            //       )
            //       ),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20),
            //           borderSide: BorderSide()
            //       )
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                child: FutureBuilder(
                    // future: GetUserService.getUserByIdUser(widget.id!),
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
                                        return UserPageDetails(id:snapshot.data![index].id);
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
            ),
    );
  }
}



