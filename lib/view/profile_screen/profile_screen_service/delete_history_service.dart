import 'package:dio/dio.dart';
import '../../../original_api/orginal_apis.dart';

class DeletePostService {
  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApis.baseUrl, responseType: ResponseType.plain));

  Future<Response> deletePost(String postId) async {
    try {
      print(orginalApis.baseUrl+'delete_medical_history/$postId');
      Response response = await dio.delete('delete_medical_history/$postId');
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
