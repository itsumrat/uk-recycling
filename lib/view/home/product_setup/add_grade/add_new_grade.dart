import 'package:crm/view/home/product_setup/new_input/new_inputs.dart';
import 'package:crm/view/home/product_setup/product_setup.dart';
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:crm/view_controller/detailsTextSideBySide.dart';
import 'package:crm/widgets/app_title_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewGrade extends StatefulWidget {
  const AddNewGrade({Key? key}) : super(key: key);

  @override
  State<AddNewGrade> createState() => _AddNewGradeState();
}

class _AddNewGradeState extends State<AddNewGrade> {


  @override
  Widget build(BuildContext context) {
    return AppWidget(
        appBarOnBack: ()=>Get.back(),
        appBarTitle: "Production setup",
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Center(
                child: AppTitleText(text: "New Production"),
              ),
              SizedBox(height: 40,),
              Padding(padding: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    AppSideBySIdeText(leftText: "Super Id: ", rightText: "Supper 01"),
                    SizedBox(height: 20,),
                    AppSideBySIdeText(leftText: "Assign by:  ", rightText: "Mr Nayon"),
                    SizedBox(height: 20,),
                    AppSideBySIdeText(leftText: "Date: ", rightText: "28/06/2022"),
                    SizedBox(height: 20,),
                    AppSideBySIdeText(leftText: "Time: ", rightText: "10:30 AM"),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Grade",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 15
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                            child:  TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none
                                  ),
                                  hintText: "Input"
                              ),
                            )
                        ),

                      ],
                    ),
                    SizedBox(height: 50,),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: ()=>Get.back(),
                        child: Container(
                          width: 180,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: AppWidgets.buildLinearGradient(),
                          ),
                          child: Center(
                            child: Text("Add",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 17
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

