import 'package:dio/dio.dart';

import '../../original_api/orginal_apis.dart';

class UpdateMedicalData{
  static NammasyastyaOrginalApis orginalApis = NammasyastyaOrginalApis();

  final dio = Dio(BaseOptions(
      baseUrl: orginalApis.baseUrl, responseType: ResponseType.plain));

      Future<Response>updateData(FormData form,String postId)async{

        print(form.toString());

        try {
          print(orginalApis.baseUrl+'update_medical_history/$postId');
          print(form.toString());
          Response response =await dio.post('update_medical_history/$postId',data:form );
          return response;
          
        } on DioError catch (e){
     print(e.message);
      rethrow;
    }
        
        catch (e) {
           print(e.toString());
      rethrow;
          
        }


      }
}