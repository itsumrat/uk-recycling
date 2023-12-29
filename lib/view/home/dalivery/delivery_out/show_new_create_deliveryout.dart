
import 'package:crm/controller/delivery_controller%20/in_controller/exstingDeliveryController.dart';
import 'package:crm/controller/delivery_controller%20/out_controller/delivery_out_controller.dart';
import 'package:crm/model/delivery_model/in_model/deliveryin_model.dart';
import 'package:crm/model/delivery_model/in_model/single_deliveryin_model.dart';
import 'package:crm/model/delivery_model/out_model/SingleExistingDeliveryOutModel.dart';
import 'package:crm/utility/app_const.dart';
import 'package:crm/view/home/dalivery/deliveryIn/createNewDelivery.dart';
import 'package:crm/view/home/dalivery/deliveryIn/deliveryIn.dart';
import 'package:crm/view/home/dalivery/delivery_out/deliveryOut.dart';
import 'package:crm/view/home/dalivery/delivery_out/existing_delivery_out_list.dart';
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:crm/view_controller/loader.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShowNewlyCreateDeliveryOut extends StatefulWidget {
  final String? deliveryId;
  const ShowNewlyCreateDeliveryOut({Key? key, this.deliveryId}) : super(key: key);

  @override
  State<ShowNewlyCreateDeliveryOut> createState() => _ShowNewlyCreateDeliveryOutState();
}

class _ShowNewlyCreateDeliveryOutState extends State<ShowNewlyCreateDeliveryOut> {

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;
  Future<SingleExistingDeliveryOutModel>? _getSingleDeliveryOut;
  var user_name, user_id;
  getUserInfo()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
   setState(() {
     user_name =  _pref.getString("user_name");
     user_id =  _pref.getString("user_id");
   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("delivery id === ${widget.deliveryId.toString()}");
    _getSingleDeliveryOut = DeliveryOutController.getSingleDeliveryOut(id: widget.deliveryId.toString());
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppWidget(
      appBarTitle: "NEW Deliveries Out Created",
      appBarOnBack: ()=>Get.back(),
      body:  FutureBuilder<SingleExistingDeliveryOutModel>(
          future: _getSingleDeliveryOut,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child:  AppLoader(),);
            }else if(snapshot.hasData){
              return SingleChildScrollView(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 50, top: 20),
                child: Column(
                  children: [
                    Center(
                      child: Text("New UD Create ${snapshot.data!.data!.delivery!.deliveryOutId}/${snapshot.data!.data!.delivery!.id}",
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
                            child: Text("$user_id}",
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
                            child: Text("${user_name}",
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
                            child: Text("${snapshot.data!.data!.delivery!.deliveryOutId}",
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
                            child: Text("${snapshot.data!.data!.delivery!.customer!.name}",
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
                    // SizedBox(height: 40,),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Text("Weight: ",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.w400,
                    //             color: Colors.black,
                    //             fontSize: 15
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(width: 20,),
                    //     Expanded(
                    //         flex: 2,
                    //         child: Text("${snapshot.data!.data!.weight} ${snapshot.data!.data!.delivery!.measurement!.name}",
                    //           style: TextStyle(
                    //               color: Colors.black54,
                    //               fontWeight: FontWeight.w400,
                    //               fontSize: 18
                    //           ),
                    //         )
                    //     )
                    //   ],
                    // ),

                    SizedBox(height: 70,),
                    InkWell(
                      onTap: ()=>Get.to(AddNewDelivery(isDeliveryOut: true,)),
                      child: Container(
                        width: 200,
                        height: 60,
                        decoration: BoxDecoration(
                            gradient: AppWidgets.buildLinearGradient(),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Add More",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: ()=>Get.to(ExistingDeliveriesOuts()),
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
