import 'package:crm/utility/utility.dart';
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verfifyMail.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppWidget(
      appBarOnBack: ()=>Get.back(),
        appBarTitle: "Forget password",
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children:  [
              SizedBox(height: MediaQuery.of(context).size.height*.07,),
              SizedBox(
                  width: MediaQuery.of(context).size.width*.70,
                  child: Center(
                    child: Text("Please enter your email address and we will send you a code to your email to reset the password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  )),

              SizedBox(height: 50,),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Enter your email address",
                    contentPadding: EdgeInsets.only(left: 25, right: 25, top: 17, bottom: 17),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(width: 1, color: AppColor.borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(width: 1, color: AppColor.borderSelectColor),
                    ),
                    suffixIcon: Icon(Icons.email_outlined)
                ),
                validator: (v){
                  if(v!.isEmpty){
                    return "Enter your email";
                  }else
                    return null;
                },
              ),
            ],
          ),
        ),
      bottomNavigationBar: InkWell(
        onTap: ()=>Get.to(VerifiyEmail()),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 50),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: AppWidgets.buildLinearGradient(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 43,),
              SizedBox(
                width: MediaQuery.of(context).size.width*.60,
                child: Center(
                  child: Text("Continue",
                    style: TextStyle(
                      fontSize: 16, color: AppColor.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: 43,
                height: 43,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.secColor.withOpacity(0.4),
                ),
                child:  Icon(Icons.arrow_forward, color: AppColor.white,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
