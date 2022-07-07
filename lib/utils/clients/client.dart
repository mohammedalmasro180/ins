import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:insoft_online_support/models/enums/feedback_enums.dart';

import 'package:insoft_online_support/models/feedback.dart';
import 'package:http/http.dart' as http;
import '../../models/customer.dart';
import 'data.dart';

class Client {
  ///region headers

  static const String serverUrl = 'https://test2.insoftonline.de/mobile/api/v1/';
  static const String _contentType = 'application/json';
  static const String _acceptHeader = 'application/json';
  //endregion
  ///region apis uri
  static const String _customer = "customer";
  static const String _login = "auth/login";
  static const String _feedback = "feedback";
  //endregion
//region user apis
  static Future<dynamic> login(String email, String password) async {
 try{
   var headers = {'Accept': _acceptHeader};
   var response =  await http.post(
     Uri.parse(serverUrl + _login),
     body: {'email': email, 'password': password},
     headers: {
       'accept': _acceptHeader,
     },
   );
   var body = jsonDecode(response.body);
   if (response.statusCode == 200) {
     setToken(body['data']['access_token']);
     return true;
   }else if(response.statusCode==401) {
     deleteToken();
   }
   return body['message'];
 }catch(e){
   if (kDebugMode) {
     print(e);
   }
   return false;
  }
  }
//endregion
//region customer apis
  static Future<Customer?> getCustomerById(int id) async {
    var response = await http.get(
      Uri.parse(serverUrl + _customer + "/$id"),
      headers: {
        'Authorization': 'Bearer ' +  getToken(),
        'accept': _acceptHeader,
        'Content-type': _contentType,
      },
    );
    if (response.statusCode == 200) {
      Customer customer;
      var body = jsonDecode(response.body)['data'];
      if (body != null) {
        customer = Customer.fromJson(body);
        return customer;
      }
    }
    else if(response.statusCode==401) {
      deleteToken();
    }
    return null;
  }

//endregion
//region feedback
  static Future<List<Feedback>?> getFeedbacks({String? status}) async {
    var response = await http.get(
      Uri.parse(serverUrl + _feedback+(status!=null?"?status=$status":'') ),
      headers: {
        'Authorization': 'Bearer ' + getToken(),
        'accept': _acceptHeader,
        'Content-type': _contentType,
      },
    );
    try {
      if (response.statusCode == 200) {
        List<Feedback> feedbacks = [];
        var body = jsonDecode(response.body)['data'];
        if (body.isNotEmpty) {
          body.forEach((element) {
            try{
              print(response.body.toString());
              feedbacks.add(Feedback.fromJson(element));

            }catch(e){
              if (kDebugMode) {
                print(e);
              }
            }
          });
        }
        return feedbacks;
      }
      else if(response.statusCode==401) {
        deleteToken();
      }
    } catch (e) {
      return null;
    }
    return null;
  }
  static Future mhdgetFeedbacks({String? status}) async {
    var response = await http.get(
      Uri.parse(serverUrl + _feedback+(status!=null?"?status=$status":'') ),
      headers: {
        'Authorization': 'Bearer ' + getToken(),
        'accept': _acceptHeader,
        'Content-type': _contentType,
      },
    );

    if (response.statusCode == 200) {
      String jsonsDataString = response.body.toString();

      var    _data = jsonDecode(jsonsDataString);
      print(_data['data'][1]);
      return _data['data'];


    }

  }

  static  listymhdgetFeedbacks({String? status,required List<String>  my_data}) async {
    var response = await http.get(
      Uri.parse(serverUrl + _feedback+(status!=null?"?status=$status":'') ),
      headers: {
        'Authorization': 'Bearer ' + getToken(),
        'accept': _acceptHeader,
        'Content-type': _contentType,
      },
    );

    if (response.statusCode == 200) {
      String jsonsDataString = response.body.toString();

      var    _data = jsonDecode(jsonsDataString);
      my_data= _data['data'][1]as List<String> ;
      return my_data;


    }

  }
static  Future getdata() async{

    Uri uri = Uri.parse("https://test2.insoftonline.de/mobile/api/v1/customer/1");

    http.Response response = await http.get(uri);
    String jsonsDataString = response.body.toString();

    var    _data = jsonDecode(jsonsDataString);
    print(_data);


    return _data;

  }


//https://test2.insoftonline.de/mobile/api/v1/customer/1


  static Future<bool> setFeedbackStatus(
      FeedbackStatus feedbackStatus, String id) async {
    var response = await http.get(
      Uri.parse(serverUrl +
          _feedback +
          "/$id/${feedbackStatusValue[feedbackStatus]?.toUpperCase()}"),
      headers: {
        'Authorization': 'Bearer ' +  getToken(),
        'accept': _acceptHeader,
        'Content-type': _contentType,
      },
    );
    if (response.statusCode == 200){
      return true;
    }
    return false;
  }
//endregion

}
