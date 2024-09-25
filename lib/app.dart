
import 'package:craftproject/presentation/screens/splash_screen.dart';
import 'package:craftproject/presentation/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings.dart';

class CraftBy extends StatefulWidget {
  const CraftBy({super.key});

  @override
  State<CraftBy> createState() => _CraftByState();
}

class _CraftByState extends State<CraftBy> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinding(),

      theme: ThemeData(
        colorSchemeSeed: AppColor.primaryColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColor.primaryColor,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,

          ),
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 15,
            color: Colors.black,
          )




        ),
        inputDecorationTheme:_InputDecorationTheme(),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),

              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,

              )
          ),
        )

      ),
      home: SplashScreen(),
    );
  }

  InputDecorationTheme _InputDecorationTheme()=>  InputDecorationTheme(
  border:_Outlineuputborader,
  focusedBorder: OutlineInputBorder(),
  errorBorder: OutlineInputBorder(),
  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),



  );
   final OutlineInputBorder _Outlineuputborader= OutlineInputBorder(
  borderSide: BorderSide(color:Colors.pink));


}
