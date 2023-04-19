import 'dart:convert';

import 'package:get_post/screen/home/modal/home_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{

  Future<List> getApi()
  async {
    String link="https://apidatahub.000webhostapp.com/MyShop/API/products.php";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    List<dynamic> productList =[]; //json.map((e) => ProductModal.fromJson(e)).toList();
    for(var x in json)
    {
      ProductModal p1=ProductModal.fromJson(x);
      productList.add(p1);
    }
    return productList;
  }

  Future<String> postApi(String pn,String pp,String po,String pc,String pd,String pr)
  async {
    String link="https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";
    Uri uri = Uri.parse(link);
    var response = await http.post(uri, body: {
      "p_name":pn,
      "p_price":pp,
      "p_offer":po,
      "p_category":pc,
      "p_rate":pr,
      "p_desc":pd,
      "p_image":"google.com",
    });

    if(response.statusCode==200)
      {
        return "Success";
      }
    return "Failed";
  }
}