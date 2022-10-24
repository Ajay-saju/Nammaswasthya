import 'package:dio/dio.dart';

import '../../original_api/orginal_apis.dart';

class UserProfileUpdateService {
  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApis.baseUrl, responseType: ResponseType.plain));

  Future<Response> updateUserdata(FormData form) async {
    try {
      print(form.toString());
      print(orginalApis.baseUrl+"update_profile");
      Response response = await dio.put("update_profile", data: form);

      print(response.data.toString());
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
