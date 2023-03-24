import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/comment_model.dart';
import '../model/post_model.dart';
import '../screen/home/widgets/comment_item.dart';
import '../services/comment_service.dart';
import '../services/utils.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

TextEditingController postIdCtr = TextEditingController();
TextEditingController nameCtr = TextEditingController();
TextEditingController emailCtr = TextEditingController();
TextEditingController body2Ctr = TextEditingController();

class _CommentPageState extends State<CommentPage> {
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
                if (postIdCtr.text.isNotEmpty &&
                    nameCtr.text.isNotEmpty &&
                    emailCtr.text.isNotEmpty) {
                  CommentModel newPost = CommentModel(
                      id: 1,
                      body: body2Ctr.text,
                      postId: int.parse(postIdCtr.text),
                      name: nameCtr.text,
                      email: emailCtr.text
                  );
                  bool result = await GetCommentService.createComment(newPost);
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
            future: GetCommentService.getComment(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: CommentItem(context, snapshot.data![i], () {
                          postIdCtr.text = snapshot.data![i].postId.toString();
                          nameCtr.text = snapshot.data![i].name;
                          emailCtr.text = snapshot.data![i].email;
                          body2Ctr.text = snapshot.data![i].body;
                          _showBottomSheet(context, () async {
                            if (postIdCtr.text.isNotEmpty &&
                                nameCtr.text.isNotEmpty &&
                                emailCtr.text.isNotEmpty &&
                                body2Ctr.text.isNotEmpty) {
                              CommentModel newPost = CommentModel(
                                  postId:int.parse(postIdCtr.text),
                                  id: snapshot.data![i].id,
                                  name: nameCtr.text,
                                  email: emailCtr.text,
                                  body: body2Ctr.text,
                                  );
                              bool result =
                              await GetCommentService.editComment(newPost);
                              if (result) {
                                Utils.snackBarSuccess(
                                    'Updated successfully', context);
                                Navigator.pop(context);
                              } else {
                                Utils.snackBarError(
                                    'Something is wrong', context);
                              }
                            } else {
                              Utils.snackBarError(
                                  'Please fill all fields', context);
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
                  controller: postIdCtr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'PostId'),
                ),
                TextFormField(
                  controller: nameCtr,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: emailCtr,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: body2Ctr,
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