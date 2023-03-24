import 'package:dio/dio.dart';

import '../api.dart';
import '../config/dio_config.dart';
import '../model/album_model.dart';
import 'log_service.dart';

class GetAlbumService {
  static final GetAlbumService _inheritance = GetAlbumService._init();

  static GetAlbumService get inheritance => _inheritance;

  GetAlbumService._init();

  static Future<List<AlbumModel>?> getAlbum() async {
    try {
      Response res = await DioConfig.inheritance.createRequest().get(
          Urls.getAlbum);
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

}