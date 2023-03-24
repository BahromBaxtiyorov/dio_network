import 'package:dio/dio.dart';
import 'package:network3/model/album_model.dart';

import '../api.dart';
import '../config/dio_config.dart';
import '../model/post_model.dart';
import '../model/user_model.dart';
import 'log_service.dart';

class GetUserService {
  static final GetUserService _inheritance = GetUserService._init();

  static GetUserService get inheritance => _inheritance;

  GetUserService._init();

  static Future<List<UserModel>?> getUser() async {
    try {
      Response res = await DioConfig.inheritance.createRequest().get(
          Urls.getUsers);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<UserModel> userList = [];
        for (var e in (res.data as List)) {
          userList.add(UserModel.fromJson(e));
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

  static Future<List<AlbumModel>?> getUserByIdAlbum(int id) async {
    try {
      Response res =
      await DioConfig.inheritance.createRequest().get("${Urls.getAlbum}?userId=$id");
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<AlbumModel> userList = [];
        for (var e in (res.data as List)) {
          userList.add(AlbumModel.fromJson(e));
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


  static Future<List<PostModel>?> getUserByIdPost(int id) async {
    try {
      Response res =
      await DioConfig.inheritance.createRequest().get("${Urls.getPosts}?userId=$id");
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());
      if (res.statusCode == 200) {
        List<PostModel> userList = [];
        for (var e in (res.data as List)) {
          userList.add(PostModel.fromJson(e));
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


  static Future<List<UserModel>?> getUserByIdUser(int id) async {
    try {
      Response res =
      await DioConfig.inheritance.createRequest().get("${Urls.getUsers}?userId=$id");
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<UserModel> userList = [];
        for (var e in (res.data as List)) {
          userList.add(UserModel.fromJson(e));
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

}