import 'package:flutter/material.dart';
import 'package:get_post/screen/home/provider/home_provider.dart';
import 'package:get_post/screen/home/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
        },
      ),
    ),
  );
}
