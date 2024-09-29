import 'package:craftproject/presentation/state_holder/email_otp_controller.dart';
import 'package:craftproject/presentation/utility/app_color.dart';
import 'package:craftproject/presentation/utility/asset_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'complete_screen.dart';

class OtpVerifactions extends StatefulWidget {
  final String otp;

  const OtpVerifactions({super.key, required this.otp});

  @override
  State<OtpVerifactions> createState() => _OtpVerifactionsState();
}

class _OtpVerifactionsState extends State<OtpVerifactions> {
  final TextEditingController pinCodeTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsPath.splashAppSvg,
              width: 120,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Enter Otp Code ",
              style: title.titleLarge,
            ),
            Text(
              "A 4 digits otp Code ",
              style: title.bodySmall,
            ),
            SizedBox(
              height: 16,
            ),
            buildPinCodeTextField(context),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.maxFinite,
              child: GetBuilder<EmailOtpVerifactionController>(
                  builder: (emailOtpController) {
                if (emailOtpController.inprogress) {
                  return Center(child: CircularProgressIndicator());
                }
                return ElevatedButton(
                    onPressed: () async {
                      final resual =
                          await emailOtpController.getEmailVerifactionOtp(
                              widget.otp, emailOtpController.toString());
                      if(resual){
                        Get.to(() => CompleteScreen());

                      }

                    },
                    child: Text('Next'));
              }),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'The experis is the Time ',
                  ),
                  TextSpan(
                      text: '100 ms',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
            TextButton(onPressed: () {}, child: Text("Resend Code")),
          ],
        ),
      ),
    );
  }

  Widget buildPinCodeTextField(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: AppColor.primaryColor,
        inactiveFillColor: Colors.transparent,
        inactiveColor: Colors.white,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      // enableActiveFill: true,

      controller: pinCodeTextEditingController,
      onCompleted: (v) {
        print("Completed");
      },
      appContext: context,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pinCodeTextEditingController.dispose();
  }
}
