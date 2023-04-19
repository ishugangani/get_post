import 'package:flutter/material.dart';
import 'package:get_post/utils/api/api_helper.dart';

class HomeProvider extends ChangeNotifier
{
  List<dynamic> proList=[];
  List image=[
    "asset/image/phone4.png",
  ];

  Future<void> getProduct()
  async {
    ApiHelper a1 = ApiHelper();
    proList = await a1.getApi();
    notifyListeners();
  }

  Future<String> postProduct(name,rate,offer,desc,cate,price)
  async {
    ApiHelper apiHelper=ApiHelper();
    String data = await apiHelper.postApi(name,price,offer,cate,desc,rate);
    notifyListeners();
    return data;
  }
}