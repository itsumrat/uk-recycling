
import 'package:crm/controller/delivery_controller%20/in_controller/exstingDeliveryController.dart';
import 'package:crm/model/delivery_model/in_model/deliveryin_model.dart';
import 'package:crm/model/delivery_model/in_model/single_deliveryin_model.dart';
import 'package:crm/utility/app_const.dart';
import 'package:crm/view/home/dalivery/deliveryIn/createNewDelivery.dart';
import 'package:crm/view/home/dalivery/deliveryIn/deliveryIn.dart';
import 'package:crm/view/home/dalivery/deliveryIn/existingDeliveries/existingDeliveries.dart';
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:crm/view_controller/loader.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_new.dart';
import 'add_more_cage_box.dart';
import 'create_cage_box.dart';


class ShowCageBox extends StatefulWidget {
  final String? deliveryId;
  const ShowCageBox({Key? key, this.deliveryId}) : super(key: key);

  @override
  State<ShowCageBox> createState() => _ShowCageBoxState();
}

class _ShowCageBoxState extends State<ShowCageBox> {

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;
  Future<SingleDeliveryInModel>? _getSingleDeliveryIn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("delivery id === ${widget.deliveryId.toString()}");
    _getSingleDeliveryIn = DeliveryInController.getSingleDeliveryIn(id: widget.deliveryId.toString());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppWidget(
      appBarTitle: "NEW Deliveries In Created",
      appBarOnBack: ()=>Get.back(),
      body:  FutureBuilder<SingleDeliveryInModel>(
        future: _getSingleDeliveryIn,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child:  AppLoader(),);
          }else if(snapshot.hasData){
            return SingleChildScrollView(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 50, top: 20),
              child: Column(
                children: [
                  Center(
                    child: Text("New UD Create ${snapshot.data!.data!.delivery!.deliveryInId}/${snapshot.data!.data!.delivery!.id}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: Text("User ID: ",
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
                          child: Text("${snapshot.data!.data!.delivery!.user!.userId}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  ),

                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Expanded(
                        child: Text("User Name: ",
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
                          child: Text("${snapshot.data!.data!.delivery!.user!.name}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Expanded(
                        child: Text("TRX ID",
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
                          child: Text("${snapshot.data!.data!.delivery!.deliveryInId}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Date: ",
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
                          child: Text("${AppConst.formetData("${snapshot.data!.data!.delivery!.date}")}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 40,),

                  Row(
                    children: [
                      Expanded(
                        child: Text("Suppliers Name: ",
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
                          child: Text("${snapshot.data!.data!.delivery!.supplier!.name}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      const Expanded(
                        child: Text("Measurement Type: ",
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
                          child: Text("${snapshot.data!.data!.delivery!.measurement!.name}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Product Type: ",
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
                          child: Text("${snapshot.data!.data!.delivery!.categories!.name}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  ),

                  // snapshot.data!.data!.delivery!.measurement!.name == "Cage" ? Column(
                  //   children: [
                  //     SizedBox(height: 40,),
                  //     Row(
                  //       children: [
                  //         Expanded(
                  //           child: Text("Cage No: ",
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Colors.black,
                  //                 fontSize: 15
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(width: 20,),
                  //         Expanded(
                  //             flex: 2,
                  //             child: Text("${snapshot.data!.data!.delivery!.caseId}",
                  //               style: TextStyle(
                  //                   color: Colors.black54,
                  //                   fontWeight: FontWeight.w400,
                  //                   fontSize: 18
                  //               ),
                  //             )
                  //         )
                  //       ],
                  //     ),
                  //   ],
                  // ) : Center(),

                  // SizedBox(height: 70,),
                  // InkWell(
                  //   onTap: ()=>Get.to(ExistingDeliveries(isIn: true)),
                  //   child: Container(
                  //     width: 200,
                  //     height: 60,
                  //     decoration: BoxDecoration(
                  //         gradient: AppWidgets.buildLinearGradient(),
                  //         borderRadius: BorderRadius.circular(10)
                  //     ),
                  //     child: Center(
                  //       child: Text("Add More",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.w400,
                  //             color: Colors.white,
                  //             fontSize: 16
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: ()=>Get.to(DeliveryIn()),
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: AppWidgets.buildLinearGradient(),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text("Back",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70,),
                ],
              ),
            );
          }else{
            return Center(child: Text("No data found."),);
          }

        }
      ),
    );

  }
}
