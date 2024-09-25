import 'package:craftproject/presentation/screens/otp_verifaction.dart';
import 'package:craftproject/presentation/utility/asset_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  final TextEditingController firstNameTextEditingController=TextEditingController();
  final TextEditingController lastNameTextEditingController=TextEditingController();

  final TextEditingController mobileNameTextEditingController=TextEditingController();

  final TextEditingController shippingAddressNameTextEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    final title=Theme.of(context).textTheme;
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
              SvgPicture.asset(AssetsPath.splashAppSvg,width: 120,),
              SizedBox(height: 16,),
              Text("Complete Profile",style:title.titleLarge,),
              Text("Get start your proifle details ",style: title.bodySmall,),
              SizedBox(height:16,),
              TextFormField(
                controller: firstNameTextEditingController,
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: lastNameTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: mobileNameTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Mobile',
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                maxLines: 5,
                controller: shippingAddressNameTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Shipping Address',
                ),
              ),


              SizedBox(height: 24,),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
          
                    onPressed: (){
                    }, child: Text('Next')),
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
    firstNameTextEditingController.dispose();
    lastNameTextEditingController.dispose();
    mobileNameTextEditingController.dispose();
    shippingAddressNameTextEditingController.dispose();


  }

}
