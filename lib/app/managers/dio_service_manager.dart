import 'package:banana_deal_by_monkeycompany/app/app_outs/data/outs_json_data.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:dio/dio.dart';

import '../routes/error_handling.dart';

class DioServiceManager {
  final Options? options;
  const DioServiceManager({
    required this.options,
  });

  Future<Map<String, dynamic>> getData({
    required String apiRoute,
    required String repo,
    required String router505,
    Map<String, dynamic>? form,
    String? error,
    FormData? formData,
    bool? isOption,
    bool? checkPass,
  }) async{
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    // form == null && formData == null
    // ? null : dio.options.contentType = 'multipart/form-data';
    try{
      final Response response = await dio.post(apiRoute,
        data: formData ?? (form == null ? null : FormData.fromMap(form)),
        options: isOption == false ? null : options,
      );
      Map<String, dynamic> data = response.data;
      JsonData result = JsonData.fromJson(data);
      if(result.status == 200){

      }
      else{
        if(checkPass == null){
          ErrorManager.errorCodeReturn(status: result.status, error: error, funcRoute: '$repo :==> ${result.msg}', msg: result.msg, apiRoute: apiRoute);
        }
      }
      return data;
    } on DioException catch (e){
      ErrorManager.errorDioReturn(e: e, router505: router505, path: repo, apiUrl: apiRoute);
      JsonData result = JsonData(status: 503, msg: e.toString(), result: []);
      Map<String, dynamic> convert = result.toJson();
      return convert;
    } finally{
      AppElement.getLoaidng;
      dio.close();
    }

  }

}