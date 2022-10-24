import 'package:dio/dio.dart';
import 'package:swasthya/original_api/orginal_apis.dart';

class UpdateUserProfilePickService {
  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();

  final dio = Dio(BaseOptions(
      baseUrl: orginalApis.baseUrl, responseType: ResponseType.plain));
  Future<Response> uploadImage(FormData form) async {
    print(form.toString());

    try {
      print(orginalApis.baseUrl+'update_profile_image');
      print(form.toString());
      Response responce = await dio.post('update_profile_image', data: form);
      return responce;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
