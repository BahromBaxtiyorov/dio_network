import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/comment_model.dart';
import '../../../services/comment_service.dart';
import '../../../services/utils.dart';

Widget CommentItem(BuildContext context, CommentModel comment, void Function() edit) {
  return SizedBox(
    height: 200,
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.27,
              child: Text(
                comment.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black
                ),
              ),
            ),
            Text(
            " ( ${comment.email},)",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.blue
              ),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Expanded(
              child: Text(
                comment.body,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black38
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                    onPressed: edit,
                    icon: Icon(Icons.edit)),
                SizedBox(height: 10,),
                IconButton(
                    onPressed: () async {
                      bool result = await GetCommentService.deleteComment(comment.id);
                      if(result){
                        Utils.snackBarSuccess('Deleted successfully', context);
                      } else {
                        Utils.snackBarError('Someting is wrong', context);
                      }
                    },
                    icon: Icon(Icons.delete)),
              ],
            )
          ],
        ),
        Divider(thickness: 1,)
      ],
    ),
  );
}