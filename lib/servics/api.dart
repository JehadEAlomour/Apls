import 'package:http/http.dart' as http;

import '../model/UserModel.dart';

class Api {




  postUser(UserModel user) async {
    try {
      var response = await http.post(Uri.parse('url.www.google.com'), body: {
        "address": user.address,
        "city": user.city,
        "email": user.email,
        "firstName": user.firstName,
        "gender": user.gender,
        "lastName": user.lastName,
        "middleName": user.middleName,
        // "percentage": user.percentage,
        "phoneNumber": user.phoneNumber,
        "postCode": user.postCode
      });
      return response.statusCode;
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
