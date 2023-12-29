import 'package:crm/appConfig.dart';
import 'package:crm/controller/cage_controller/cage_controller.dart';
import 'package:crm/controller/delivery_controller%20/in_controller/delivery_type_controller.dart';
import 'package:crm/controller/delivery_controller%20/in_controller/product_category_controller.dart';
import 'package:crm/model/cage_model/cage_model.dart';
import 'package:crm/model/delivery_model/in_model/deliveryInTransactionsModel.dart';
import 'package:crm/controller/delivery_controller%20/in_controller/exstingDeliveryController.dart';
import 'package:crm/model/delivery_model/in_model/deliveryInTransactionsModel.dart';
import 'package:crm/model/delivery_model/in_model/delivery_model.dart';
import 'package:crm/model/delivery_model/in_model/deliveryin_model.dart';
import 'package:crm/model/delivery_model/in_model/product_category_model.dart';
import 'package:crm/model/delivery_model/in_model/single_deliveryin_transaction_model.dart';
import 'package:crm/utility/app_const.dart';
import 'package:crm/view/home/dalivery/deliveryIn/existingDeliveries/transactions.dart';
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:crm/view_controller/snackbar_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../model/delivery_model/in_model/single_deliveryin_model.dart';
import 'showTransactions.dart';


class EditTranscation extends StatefulWidget {
  final Transaction singleTransaction;
  final SingleDeliveryInModel singleDelivery;
  final ExistingDeliveryInDatum?  existingDeliveryInDatum;

  const EditTranscation({Key? key, required this.singleTransaction, required this.singleDelivery, this.existingDeliveryInDatum}) : super(key: key);

  @override
  State<EditTranscation> createState() => _EditTranscationState();
}

class _EditTranscationState extends State<EditTranscation> {

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;
  String? selectedCageOn;
  String? selectedDeliveryType;
  String? selectedProductCategory;

  final userName = TextEditingController();
  final userId = TextEditingController();
  final date = TextEditingController();
  final deliveryType = TextEditingController();
  final productCategory = TextEditingController();
  final cageNo = TextEditingController();
  final weight = TextEditingController();

  List<DeliveryDatum>? _deliveryTypeList = [];
  void _getDeliveryTypeFuture()async{
    var res = await  DeliveryTypeController.getDeliveryType();
    for(var i in res.data!){
     setState(() {
       _deliveryTypeList!.add(i);
     });
    }
  }

  List<ProductCategoryDatum>? _productCategoryList = [];
  void _getProductCategoryFuture()async{
    var res = await  DeliveryInProductCategoryController.getProductCategory();
    for(var i in res!.data!){
      setState(() {
        _productCategoryList!.add(i);
      });
    }
  }


  List<CageDatum>? _allCageList = [];
  //get product category
  void _getAllCageList()async{
    var res = await CageController.getCageNo();
    for(var i in res!.data!){
      setState(() {
        _allCageList?.add(i);
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getDeliveryTypeFuture();
    // _getProductCategoryFuture();
    _getAllCageList();
    userName.text = widget!.singleTransaction!.user!.name!;
    userId.text = widget!.singleTransaction!.user!.userId!;
    date.text =AppConst.formetData(widget!.singleTransaction!.date);
    weight.text = "${widget!.singleTransaction!.weight.toString()!}";

    print("existingDeliveryInDatum == ${widget.existingDeliveryInDatum}");
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppWidget(
      appBarTitle: "Transaction ID: ${widget.singleDelivery!.data!.delivery!.deliveryInId}/${widget.singleTransaction.id}",
      textSize: 20,
      appBarOnBack: ()=>Get.back(),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // SizedBox(height: 50,),
            // Text("Cage/Box",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w600,
            //     color: Colors.black,
            //     fontSize: 30
            //   ),
            // ),
            // SizedBox(height: 50,),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Text("User Name",
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
            //         child: TextFormField(
            //           controller: userName,
            //           readOnly: true,
            //           decoration: InputDecoration(
            //               fillColor: Colors.grey.shade200,
            //               filled: true,
            //               border: OutlineInputBorder(
            //                   borderSide: BorderSide.none
            //               ),
            //               hintText: "User Name"
            //           ),
            //         )
            //     )
            //   ],
            // ),
            // SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Text("User ID",
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
            //         child: TextFormField(
            //           readOnly: true,
            //           controller: userId,
            //           decoration: InputDecoration(
            //               fillColor: Colors.grey.shade200,
            //               filled: true,
            //               border: OutlineInputBorder(
            //                   borderSide: BorderSide.none
            //               ),
            //               hintText: "User ID 02"
            //           ),
            //         )
            //     )
            //   ],
            // ),
            //
            //
            // SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Text("Date",
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
            //         child: TextFormField(
            //           readOnly: true,
            //           controller: date,
            //           decoration: InputDecoration(
            //               fillColor: Colors.grey.shade200,
            //               filled: true,
            //               border: OutlineInputBorder(
            //                   borderSide: BorderSide.none
            //               ),
            //               hintText: "Auto Fill up"
            //           ),
            //         )
            //     )
            //   ],
            // ),
            // SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Text("Delivery Type",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w400,
            //             color: Colors.black,
            //             fontSize: 15
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: 20,),
            //     Expanded(
            //       flex: 2,
            //       child: DropdownButtonHideUnderline(
            //         child: DropdownButton2<String>(
            //           isExpanded: true,
            //           hint: Text(
            //             'Select One',
            //             style: TextStyle(
            //               fontSize: 16,
            //               color: Theme.of(context).hintColor,
            //             ),
            //           ),
            //           items: (_deliveryTypeList)?.map((item) => DropdownMenuItem<String>(
            //             value: item.id!.toString(),
            //             child: Text(
            //               item.name!,
            //               style: const TextStyle(
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ))
            //               .toList(),
            //           value: selectedDeliveryType,
            //           onChanged: (String? value) {
            //             setState(() {
            //               selectedDeliveryType = value;
            //             });
            //           },
            //           buttonStyleData:  ButtonStyleData(
            //             decoration: BoxDecoration(
            //                 color: Colors.grey.shade200,
            //                 borderRadius: BorderRadius.circular(5)
            //             ),
            //             padding: EdgeInsets.symmetric(horizontal: 16),
            //             height: 60,
            //             width: 140,
            //           ),
            //           menuItemStyleData: const MenuItemStyleData(
            //             height: 40,
            //           ),
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),
            // SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Text("Product Category",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w400,
            //             color: Colors.black,
            //             fontSize: 15
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: 20,),
            //     Expanded(
            //       flex: 2,
            //       child: DropdownButtonHideUnderline(
            //         child: DropdownButton2<String>(
            //           isExpanded: true,
            //           hint: Text(
            //             'Select One',
            //             style: TextStyle(
            //               fontSize: 16,
            //               color: Theme.of(context).hintColor,
            //             ),
            //           ),
            //           items: _productCategoryList?.map((item) => DropdownMenuItem<String>(
            //             value: item.id.toString(),
            //             child: Text(
            //               item!.name!,
            //               style: const TextStyle(
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ))
            //               .toList(),
            //           value: selectedProductCategory,
            //           onChanged: (String? value) {
            //             setState(() {
            //               selectedProductCategory = value;
            //             });
            //           },
            //           buttonStyleData:  ButtonStyleData(
            //             decoration: BoxDecoration(
            //                 color: Colors.grey.shade200,
            //                 borderRadius: BorderRadius.circular(5)
            //             ),
            //             padding: EdgeInsets.symmetric(horizontal: 16),
            //             height: 60,
            //             width: 140,
            //           ),
            //           menuItemStyleData: const MenuItemStyleData(
            //             height: 40,
            //           ),
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),
            // SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Text("Cage No",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w400,
            //             color: Colors.black,
            //             fontSize: 15
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: 20,),
            //     Expanded(
            //       flex: 2,
            //       child: DropdownButtonHideUnderline(
            //         child: DropdownButton2<String>(
            //           isExpanded: true,
            //           hint: Text(
            //             'Select One',
            //             style: TextStyle(
            //               fontSize: 16,
            //               color: Theme.of(context).hintColor,
            //             ),
            //           ),
            //           items: items
            //               .map((String item) => DropdownMenuItem<String>(
            //             value: item,
            //             child: Text(
            //               item,
            //               style: const TextStyle(
            //                 fontSize: 14,
            //               ),
            //             ),
            //           ))
            //               .toList(),
            //           value: selectedValue,
            //           onChanged: (String? value) {
            //             setState(() {
            //               selectedValue = value;
            //             });
            //           },
            //           buttonStyleData:  ButtonStyleData(
            //             decoration: BoxDecoration(
            //                 color: Colors.grey.shade200,
            //                 borderRadius: BorderRadius.circular(5)
            //             ),
            //             padding: EdgeInsets.symmetric(horizontal: 16),
            //             height: 60,
            //             width: 140,
            //           ),
            //           menuItemStyleData: const MenuItemStyleData(
            //             height: 40,
            //           ),
            //         ),
            //       ),
            //     ),
            //
            //   ],
            // ),
            widget.singleDelivery!.data!.delivery!.measurement!.name == "Cage" ? Row(
              children: [
                Expanded(
                  child: Text("Cage No",
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select One',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items:(_allCageList)?.map((item) => DropdownMenuItem<String>(
                        value: item!.id.toString(),
                        child: Text(
                          item!.caseName!,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedCageOn,
                      onChanged: (String? value) {
                        setState(() {
                          selectedCageOn = value;
                        });
                      },
                      buttonStyleData:  ButtonStyleData(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 60,
                        width: 140,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),

              ],
            ) : Center(),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Text("${widget.singleDelivery!.data!.delivery!.measurement!.name == "Cage" && widget.singleDelivery!.data!.delivery!.measurement!.name == "KG" ? "Weight" : widget.singleDelivery!.data!.delivery!.measurement!.name}",
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
                      controller: weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          hintText: "00 "
                      ),
                    )
                )
              ],
            ),

            SizedBox(height: 70,),
            InkWell(
              onTap: ()=>editTransition(),
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                    gradient: AppWidgets.buildLinearGradient(),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: isEditingLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Save",
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

  bool isEditingLoading = false;
  editTransition() async{
    setState(() =>isEditingLoading = true);
    var res = await DeliveryInController.editTranscations(case_no: selectedCageOn ?? "null", weight: weight.text, id: widget.singleTransaction!.id.toString());
    if(res.statusCode == 200){
      Get.to(Transactions(existingDeliveryInDatum: widget.existingDeliveryInDatum, singleDeliveryInModel: widget.singleDelivery,  ));
      AppSnackbar.appSnackbar("Edit success.", Colors.green, context);
    }else{
      AppSnackbar.appSnackbar("Something went wrong.", Colors.red, context);
    }
    setState(() =>isEditingLoading = false);

  }
}
