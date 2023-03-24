import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../pages/comment_page.dart';
import '../screen/home/widgets/post_page_item.dart';
import '../services/post_service.dart';
import '../services/utils.dart';

class PostPage2 extends StatefulWidget {
  const PostPage2({Key? key}) : super(key: key);

  @override
  State<PostPage2> createState() => _PostPage2State();
}

TextEditingController userIdCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController bodyCtr = TextEditingController();

class _PostPage2State extends State<PostPage2> {
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
      body:

          Padding(
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
                                child: postPageItem(context, snapshot.data![i],
                                ),
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
