import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/post_model.dart';
import '../../../services/comment_service.dart';
import 'comment_item.dart';
import 'comment_page_item.dart';

Widget postPageItem(BuildContext context, PostModel post) {
  return SizedBox(
    height: 250,
    child: Column(
      children: [
        Text(
          post.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black
          ),
        ),
        SizedBox(height: 5,),
        Expanded(
          child: Text(
            post.body,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black38
            ),
          ),
        ),
        SizedBox(height:5),
        Row(
          children: [
            Icon(Icons.heart_broken,size: 30,),
            SizedBox(width:15),
            IconButton(
              onPressed: () {
                // FutureBuilder(
                //     future: GetCommentService.getComment(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return  showModalBottomSheet(
                //             context: context,
                //             isScrollControlled: true,
                //             builder: (
                //                 BuildContext context,
                //                 ) {
                //                ;
                //             });
                //           // ListView.builder(
                //           //   itemCount: snapshot.data!.length,
                //           //   itemBuilder: (context, i) {
                //           //     return Padding(
                //           //       padding:
                //           //       EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                //           //       child: CommentPageItem(context, snapshot.data![i],),
                //           //     );
                //           //   });
                //       } else {
                //         return const Center(
                //           child: Text('No data'),
                //         );
                //       }
                //     });
              },
              icon: Icon(Icons.comment,size: 25,), ),
            SizedBox(width:15),
            Icon(Icons.share,size: 30,),
            Divider(thickness: 1,),
          ],
        ),
        Divider(thickness: 1,),
      ],
    ),
  );
}

// void _showBottomSheet(BuildContext context, void Function() func) {
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (
//           BuildContext context,
//           ) {
//         return ;
//       });
// }