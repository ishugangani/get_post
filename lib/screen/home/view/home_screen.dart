import 'package:flutter/material.dart';
import 'package:get_post/screen/home/modal/home_modal.dart';
import 'package:get_post/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeProvider? True, False;
  List data=[];
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtOffer = TextEditingController();
  TextEditingController txtCate = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  TextEditingController txtRate = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getProduct();
  }

  @override
  Widget build(BuildContext context) {
    True = Provider.of<HomeProvider>(context, listen: true);
    False = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff497174),
          centerTitle: true,
          title: Text("Product API"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset("${True!.image[0]}",height: 50,width: 50),
              title: Text("${True!.proList[index].productName}"),
              subtitle: Text("${True!.proList[index].productCategory}"),
              trailing: Text("${True!.proList[index].productPrice}"),
            );
          },
          itemCount: True!.proList.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: SingleChildScrollView(
                    child: AlertDialog(
                      actionsPadding: EdgeInsets.all(10),
                      actions: [
                        Center(
                          child: Text(
                            "PRODUCT",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffEB6440),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: txtName,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xffEB6440),
                                width: 1.5,
                              ),
                            ),
                            label: Text(
                              "Name",
                              style: TextStyle(
                                color: Color(0xff497174)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: txtPrice,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xffEB6440),
                                width: 1.5,
                              ),
                            ),
                            label: Text(
                              "Price",
                              style: TextStyle(
                                  color: Color(0xff497174)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: txtOffer,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xffEB6440),
                                width: 1.5,
                              ),
                            ),
                            label: Text(
                              "Offer",
                              style: TextStyle(
                                  color: Color(0xff497174)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: txtCate,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xffEB6440),
                                width: 1.5,
                              ),
                            ),
                            label: Text(
                              "Category",
                              style: TextStyle(
                                  color: Color(0xff497174)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: txtDesc,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xffEB6440),
                                width: 1.5,
                              ),
                            ),
                            label: Text(
                              "Description",
                              style: TextStyle(
                                  color: Color(0xff497174)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: txtRate,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xffEB6440),
                                width: 1.5,
                              ),
                            ),
                            label: Text(
                              "Rating",
                              style: TextStyle(
                                  color: Color(0xff497174)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async{
                              String name = txtName.text;
                              String price = txtPrice.text;
                              String offer = txtOffer.text;
                              String cate = txtCate.text;
                              String desc = txtDesc.text;
                              String rate = txtRate.text;

                              ProductModal p1 = ProductModal(
                                id: "100",
                                productName: name,
                                productPrice: price,
                                productOffer: offer,
                                productCategory: cate,
                                productImage: True!.image[0],
                                productDesc: desc,
                                productRate: rate,
                              );
                              data.add(p1);
                              String progress = await False!.postProduct(name, rate, offer, desc, cate, price);
                              False!.getProduct();
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${progress}"),
                                ),
                              );
                            },
                            child: Text("SUBMIT"),
                            style: ElevatedButton.styleFrom(backgroundColor: Color(0xffEB6440)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: Color(0xffEB6440),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
