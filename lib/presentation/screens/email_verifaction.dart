import 'package:craftproject/presentation/screens/otp_verifaction.dart';
import 'package:craftproject/presentation/state_holder/email_controller.dart';
import 'package:craftproject/presentation/utility/asset_path.dart';
import 'package:craftproject/presentation/utility/contrant.dart';
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
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final title=Theme.of(context).textTheme;
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
             SvgPicture.asset(AssetsPath.splashAppSvg,width: 120,),
              SizedBox(height:8,),
              Text("wellcome Back",style:title.titleLarge,),
              Text("Enter your email",style: title.bodySmall,),
              SizedBox(height:16,),
              TextFormField(
                controller: emailTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (String ? value){
                  if(value?.isEmpty ?? true){
                    return 'Enter the email';
                  }
                  if(Constrant.emailValidationRegExp.hasMatch(value!)==false);
                  return 'enter the email valid';
                },
              ),
              SizedBox(height:24,),
              SizedBox(
                width: double.maxFinite,
                child: GetBuilder<EmailVerifactionController>(
                  builder: (emailVerifactionController) {
                    if(emailVerifactionController.inprogress){
                      return Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(

                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            Get.to(OtpVerifactions(otp: emailTextEditingController.text));

                          }

                        }, child: Text('Next'));
                  }
                ),
              )

            ],
          ),
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
