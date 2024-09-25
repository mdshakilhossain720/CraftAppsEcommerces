import 'package:craftproject/presentation/screens/email_verifaction.dart';
import 'package:craftproject/presentation/screens/home_screen.dart';
import 'package:craftproject/presentation/utility/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'nab_bar_bottom.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState(){
    super.initState();
    moveToNext();


  }

  Future<void> moveToNext() async {
    await Future.delayed(Duration(seconds: 3));
   Get.to(BottomNavBar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
             Spacer(),
           SvgPicture.asset(AssetsPath.splashAppSvg,width: 120,),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 20,),
            Text('version 1.0.0'),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
