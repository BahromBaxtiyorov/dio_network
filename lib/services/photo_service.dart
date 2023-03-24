
import 'package:dio/dio.dart';

import '../api.dart';
import '../config/dio_config.dart';
import '../model/photo_model.dart';
import 'log_service.dart';

class GetPhotoService {
  static final GetPhotoService _inheritance = GetPhotoService._init();

  static GetPhotoService get inheritance => _inheritance;

  GetPhotoService._init();

  static Future<List<PhotoModel>?> getPhoto() async {
    try {
      Response res = await DioConfig.inheritance.createRequest().get(
          Urls.getPhotos);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<PhotoModel> userList = [];
        for (var e in (res.data as List)) {
          userList.add(PhotoModel.fromJson(e));
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
