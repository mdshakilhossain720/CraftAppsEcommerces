import 'package:craftproject/presentation/screens/otp_verifaction.dart';
import 'package:craftproject/presentation/utility/asset_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class EmailVerifaction extends StatefulWidget {
  const EmailVerifaction({super.key});

  @override
  State<EmailVerifaction> createState() => _EmailVerifactionState();
}

class _EmailVerifactionState extends State<EmailVerifaction> {
  final TextEditingController emailTextEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    final title=Theme.of(context).textTheme;
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
           SvgPicture.asset(AssetsPath.splashAppSvg,width: 120,),
            SizedBox(height: 30,),
            Text("wellcome Back",style:title.titleLarge,),
            Text("Enter your email",style: title.bodySmall,),
            SizedBox(height: 20,),
            TextFormField(
              controller: emailTextEditingController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(

                  onPressed: (){
                    Get.to(OtpVerifactions(otp: emailTextEditingController.text));
                    // Get.to(()=>emailTextEditingController);
                  }, child: Text('Next')),
            )

          ],
        ),
      ),

    );
  }

  @override
  void dispose(){
    super.dispose();
    emailTextEditingController.dispose();


  }

}
