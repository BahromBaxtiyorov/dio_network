import 'package:flutter/material.dart';
import 'package:network3/services/post_service.dart';

import '../../../model/post_model.dart';
import '../../../services/utils.dart';


Widget postItem(BuildContext context, PostModel post, void Function() edit) {
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
        Row(
          children: [
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
            Column(
              children: [
                IconButton(
                    onPressed: edit,
                    icon: Icon(Icons.edit)),
                SizedBox(height: 10,),
                IconButton(
                    onPressed: () async {
                      bool result = await GetPostService.deletePost(post.id);
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
        SizedBox(height:5),
        Divider(thickness: 1,)
      ],
    ),
  );
}