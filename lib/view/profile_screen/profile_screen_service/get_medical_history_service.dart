import 'package:dio/dio.dart';
import 'package:swasthya/main.dart';
import '../../../original_api/orginal_apis.dart';

class MedicalHistoryApiService {
  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApis.baseUrl, responseType: ResponseType.plain));

  Future<Response> getMedicalHistory() async {
    String id =prefer.getString('id').toString();
    try {
      print(orginalApis.baseUrl+'get_medical_history/$id');
      Response response = await dio.get('get_medical_history/$id');
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
