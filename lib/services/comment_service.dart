import 'package:dio/dio.dart';

import '../api.dart';
import '../api_comment.dart';
import '../config/dio_config.dart';
import '../model/comment_model.dart';
import 'log_service.dart';

class GetCommentService {
  static final GetCommentService _inheritance = GetCommentService._init();
  static GetCommentService get inheritance => _inheritance;
  GetCommentService._init();

  static Future<List<CommentModel>?> getComment() async {
    try {
      Response res = await DioConfig.inheritance.createRequest().get(Urls2.getComments);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<CommentModel> userList = [];
        for (var e in (res.data as List)) {
          userList.add(CommentModel.fromJson(e));
        }
        return userList;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }
    return null;
  }

  static Future<bool> createComment(CommentModel newPost) async {
    try {
      Response res = await DioConfig.inheritance.createRequest().post(
          Urls.addPost,
          data:  {
            "postId": newPost.postId,
            "name": newPost.name,
            "email": newPost.email,
            "body": newPost.body
          }
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;

      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }

  static Future<bool> editComment(CommentModel newPost) async {
    try {
      Response res = await DioConfig.inheritance.createRequest().put(
          Urls2.updateComments + newPost.id.toString(),
          data:  {
            "postId": newPost.postId,
            "name": newPost.name,
            "email": newPost.email,
            "body": newPost.body,
          }
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;

      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }


  static Future<bool> deleteComment(int id) async {
    try {
      Response res = await DioConfig.inheritance.createRequest().delete(
        Urls.deletePost + id.toString(),
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;

      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }
}