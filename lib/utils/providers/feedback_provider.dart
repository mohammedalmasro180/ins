
import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:insoft_online_support/models/enums/feedback_enums.dart';

import '../../models/customer.dart';
import '../clients/client.dart';
import 'package:flutter/cupertino.dart';
import 'package:insoft_online_support/models/feedback.dart';

class FeedbacksProvider with ChangeNotifier{
  List<Feedback> _reviewingFeedbacks=[];
  List<Feedback> _doneFeedbacks=[];
  List<Feedback> _assignedFeedbacks=[];
  List<Feedback> _feedbacks=[];

  late bool _loading=false;
  int _page=1,_totalPage=1,_paginator=7;

  get loading=>_loading;

  get paginator => _paginator;

  get totalPage => _totalPage;

  List<Feedback> get reviewingFeedbacks => _reviewingFeedbacks;
  List<Feedback> get doneFeedbacks => _doneFeedbacks;
  List<Feedback> get assignedFeedbacks => _assignedFeedbacks;
  List<Feedback> get feedbacks => _feedbacks;

  int get page => _page;
  /*Future<bool> refreshOrders(String status) async {
    _feedbacks=[];
    notifyListeners();
    _page=1;
      Map<String, dynamic> ordersMap = await Client.getFeedBacks(status, _page, _paginator);
      if ((ordersMap["orders"]?.length??0) > 0) {
        _feedbacks=ordersMap['orders'];
        _totalPage = ordersMap['lastPage'];
        notifyListeners();
        _page++;
        return true;
    }
    return false;
  }
  Future<bool> makeOrderASDone(int id)async{
  try{
    bool itsDone=  await Client.makeOrderAsDone(id);
   if(itsDone){
     int index = _feedbacks.indexWhere((element) => element.id.toString() == "$id");
     Future.delayed(const Duration(milliseconds: 3700),(){
       _feedbacks[index].status=Fe().delivered;
       notifyListeners();
     });
     Future.delayed(const Duration(milliseconds: 4150),(){
       _feedbacks.removeWhere((element) => element.id==id);
       notifyListeners();
     });
     return true;
   }
  }catch(e){
    return false;
  }
    return false;
  }
  Future<bool> getClientOrders(String status) async {
     if (page<=_totalPage) {
       Map<String, dynamic> ordersMap = await Client.getFeedBacks(
           status, _page, _paginator);
       if (ordersMap['orders'].length > 0) {
         _feedbacks.addAll(ordersMap['orders']);
         _totalPage = ordersMap['lastPage'];
         _page+=1;
       }
       notifyListeners();
       return true;
  }
     return false;
  }*/
Future<bool> initFeedbacks() async {
  _reviewingFeedbacks= (await Client.getFeedbacks(status: feedbackStatusValue[FeedbackStatus.reviewing]))??[];
  _doneFeedbacks= (await Client.getFeedbacks(status: feedbackStatusValue[FeedbackStatus.done]))??[];
  _assignedFeedbacks= (await Client.getFeedbacks(status: feedbackStatusValue[FeedbackStatus.assigned]))??[];
  _feedbacks.addAll(_assignedFeedbacks);
  _feedbacks.addAll(_doneFeedbacks);
  notifyListeners();
  if(_reviewingFeedbacks.isNotEmpty || _feedbacks.isNotEmpty) {
    return true;
  }else {
    return false;
  }
}
Future<bool>updateFeedbackStatus(FeedbackStatus feedbackStatus,String id)async{
  startLoading();
   Client.setFeedbackStatus(feedbackStatus, id);
 // print("feedback status is $feedbackStatus");
  //print(_reviewingFeedbacks.where((element) => element.id.toString() == "$id").toList()[0].status);
    //int index=_reviewingFeedbacks.indexWhere((element) => element.id==id);
    //_reviewingFeedbacks[index].status=feedbackStatusValue[feedbackStatus]??"";
  await initFeedbacks();
  notifyListeners();
  stopLoading();
  return true;
}
  clearFeedback(){
     _reviewingFeedbacks=[];_page=1;_totalPage=1;_paginator=7;

     notifyListeners();
     return true;
  }
  startLoading(){
    _loading=true;
    notifyListeners();
  }
  stopLoading(){
    _loading=false;
    notifyListeners();
  }

}