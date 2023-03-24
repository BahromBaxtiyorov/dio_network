import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/comment_model.dart';

Widget CommentPageItem(BuildContext context, CommentModel comment,) {
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
          ],
        ),
        Divider(thickness: 1,)
      ],
    ),
  );
}