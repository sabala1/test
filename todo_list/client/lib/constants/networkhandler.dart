import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list/constants/errorhandler.dart';
import 'package:todo_list/constants/uri.dart';
import 'package:todo_list/constants/utils.dart';
import 'package:todo_list/models/informationModel.dart';

class Networkhandler {
  void information({
    required BuildContext context,
    required String namelast,
    required String phone,
    required String address,
  }) async {
    try {
      InformationModel informationModel = InformationModel(
        namelast: namelast,
        phone: phone,
        address: address,
      );
      http.Response res = await http.post(Uri.parse('$uri/api/information'),
          body: informationModel.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'บันทึกสำเร็จ');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
