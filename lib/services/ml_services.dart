import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MLService{
  Dio dio = Dio();

  Future<String?> convertImage(Uint8List imageData) async{
    
    try{
      var encodedData = await compute(base64Encode, imageData);
      FormData formData = FormData.fromMap({
        'image' : encodedData,
      });
      print('ok1');
      Response response = await dio.post(
        "https://jiantestflask.run.goorm.io/upload",
        data : formData,
      );
      if (response.statusCode == 200){
        return 'Detecting Messages are showing!';
      } else {
        return null;
      }
    } catch(e){
      print(e);
      return "Error";
    }
  }
}