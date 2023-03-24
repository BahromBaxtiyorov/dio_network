import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network3/services/post_service.dart';

import '../model/post_model.dart';
import '../screen/home/widgets/post_item.dart';
import '../services/utils.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   TextEditingController userIdCtr = TextEditingController();
//   TextEditingController titleCtr = TextEditingController();
//   TextEditingController bodyCtr = TextEditingController();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     GetPostService.getPost();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blueGrey,
//       title: Text("Posts",
//         style: TextStyle(color: Colors.white),),
//         actions: [
//         IconButton(onPressed: (){
//          _showBottomSheet(context,
//              ()async {
//                if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty ) {
//                  PostModel newPost = PostModel(
//                      userId: int.parse(userIdCtr.text),
//                      id: 1,
//                      title: titleCtr.text,
//                      body: bodyCtr.text);
//                  bool result =  await GetPostService.createPost(newPost);
//                  if(result){
//                    Utils.snackBarSuccess('Added successfully',context);
//                    Navigator.pop(context);
//                  }else{
//                    Utils.snackBarError('Someting is wrong',context);
//                  }
//                }else{
//                  Utils.snackBarError('Please fill all fields', context);
//                }
//              }
//          );
//         },
//             icon: Icon(Icons.add))
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: FutureBuilder(
//             future: GetPostService.getPost(),
//             builder: (context,snapshot) {
//               if(snapshot.hasData){
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, i) {
//                     return Padding (
//                       padding: EdgeInsets.symmetric(vertical:5,horizontal: 10),
//                       child: postItem(context,
//                           snapshot.data![i],
//                           (){
//                         userIdCtr.text = snapshot.data![i].userId.toString();
//                         userIdCtr.text = snapshot.data![i].title.toString();
//                         userIdCtr.text = snapshot.data![i].body.toString();
//                         _showBottomSheet(context,
//                             () async{
//                               if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty ) {
//                                 PostModel newPost = PostModel(
//                                     userId: int.parse(userIdCtr.text),
//                                     id: snapshot.data![i].id,
//                                     title: titleCtr.text,
//                                     body: bodyCtr.text);
//                                 bool result =  await GetPostService.createPost(newPost);
//                                 if(result){
//                                   Utils.snackBarSuccess('Updated successfully',context);
//                                   Navigator.pop(context);
//                                 }else{
//                                   Utils.snackBarError('Something is wrong',context);
//                                 }
//                               }else{
//                                 Utils.snackBarError('Please fill all fields', context);
//                               }
//                             }
//                         );
//                           }
//                       ),
//                     );
//                   },);
//               } else {
//                 return Center(
//                  child: Text("No data")
//                 );
//               }
//             }),
//       )
//     );
//   }
//
//
//   void _showBottomSheet(BuildContext context,void Function() func) {
//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         builder: (BuildContext context) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 //mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const Text(
//                     'Add new post',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   TextFormField(
//                     controller: userIdCtr,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(labelText: 'UserID'),
//                   ),
//                   TextFormField(
//                     controller: titleCtr,
//                     decoration: const InputDecoration(
//                         labelText: 'Title'),
//                   ),
//                   TextFormField(
//                     controller: bodyCtr,
//                     decoration: const InputDecoration(labelText: 'Body'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                      func;
//                     },
//                     child: const Text('Add'),
//                   ),
//                   const SizedBox(height: 400,)
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
// }

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

TextEditingController userIdCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController bodyCtr = TextEditingController();

class _PostPageState extends State<PostPage> {
  // @override
  // void initState(){
  //   super.initState();
  //   GetPostService.getUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Posts',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showBottomSheet(context, () async {
                if (userIdCtr.text.isNotEmpty &&
                    titleCtr.text.isNotEmpty &&
                    bodyCtr.text.isNotEmpty) {
                  PostModel newPost = PostModel(
                      userId: int.parse(userIdCtr.text),
                      id: 1,
                      title: titleCtr.text,
                      body: bodyCtr.text);
                  bool result = await GetPostService.createPost(newPost);

                  if (result) {
                    Utils.snackBarSuccess('Added successfully', context);
                    Navigator.pop(context);
                  } else {
                    Utils.snackBarError('Someting is wrong', context);
                  }
                } else {
                  Utils.snackBarError('Please fill all fileds', context);
                }
              });
            },
            icon: Icon(Icons.add),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: GetPostService.getPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: postItem(context, snapshot.data![i], () {
                          userIdCtr.text = snapshot.data![i].userId.toString();
                          titleCtr.text = snapshot.data![i].title;
                          bodyCtr.text = snapshot.data![i].body;
                          _showBottomSheet(context, () async {
                            if (userIdCtr.text.isNotEmpty &&
                                titleCtr.text.isNotEmpty &&
                                bodyCtr.text.isNotEmpty) {
                              PostModel newPost = PostModel(
                                  userId: int.parse(userIdCtr.text),
                                  id: snapshot.data![i].id,
                                  title: titleCtr.text,
                                  body: bodyCtr.text);
                              bool result =
                                  await GetPostService.editPost(newPost);
                              if (result) {
                                Utils.snackBarSuccess(
                                    'Update successfully', context);
                                Navigator.pop(context);
                              } else {
                                Utils.snackBarError(
                                    'Someting is wrong', context);
                              }
                            } else {
                              Utils.snackBarError(
                                  'Please fill all fileds', context);
                            }
                          });
                        }),
                      );
                    });
              } else {
                return const Center(
                  child: Text('No data'),
                );
              }
            }),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, void Function() func) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (
        BuildContext context,
      ) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Add new post',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextFormField(
                  controller: userIdCtr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'UserId'),
                ),
                TextFormField(
                  controller: titleCtr,
                  decoration: InputDecoration(labelText: 'Age'),
                ),
                TextFormField(
                  controller: bodyCtr,
                  decoration: InputDecoration(labelText: 'Salary'),
                ),
                ElevatedButton(
                  onPressed: func,
                  child: Text('Add'),
                ),
                SizedBox(
                  height: 400,
                )
              ],
            ),
          ),
        );
      });
}
