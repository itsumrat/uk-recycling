
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'showPiecesPallet.dart';


class AddMorePiecesPallet extends StatefulWidget {
  const AddMorePiecesPallet({Key? key}) : super(key: key);

  @override
  State<AddMorePiecesPallet> createState() => _AddMorePiecesPalletState();
}

class _AddMorePiecesPalletState extends State<AddMorePiecesPallet> {

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppWidget(
      appBarTitle: "Delivery In ID: D1000034",
      appBarOnBack: ()=>Get.back(),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(height: size.height*.02,),
            Center(child: Text("Cage/Box",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            ),),
            SizedBox(height: size.height*.08,),
            Row(
              children: [
                Expanded(
                  child: Text("User ID",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          hintText: "Auto Fill up"
                      ),
                    )
                )
              ],
            ),

            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Text("User Name",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          hintText: "Auto Fill up"
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Text("Date",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          hintText: "Auto Fill up"
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Text("Pieces",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 15
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          hintText: "12"
                      ),
                    )
                )

              ],
            ),

            SizedBox(height: 70,),
            InkWell(
              onTap: ()=>Get.to(ShowPiecesPallet()),
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                    gradient: AppWidgets.buildLinearGradient(),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Input",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
