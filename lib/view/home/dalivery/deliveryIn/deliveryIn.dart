
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../appBottomNavigationBar.dart';
import 'add_delivery_type.dart';
import 'add_product_category/addProductCategory.dart';
import 'createNewDelivery.dart';
import 'existingDeliveries/existingDeliveries.dart';

class DeliveryIn extends StatefulWidget {
  const DeliveryIn({Key? key,}) : super(key: key);

  @override
  State<DeliveryIn> createState() => _DeliveryInState();
}

class _DeliveryInState extends State<DeliveryIn> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppWidget(
      appBarTitle: "Delivery In",
      appBarOnBack: ()=>Get.to(AppBottomNavigationBar()),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: size.height*.05,),
            InkWell(
              onTap: ()=>Get.to(AddNewDelivery()),
              child: Container(
                width: size.width,
                height: 70,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  gradient: AppWidgets.buildLinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("New",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: ()=>Get.to(ExistingDeliveries()),
              child: Container(
                width: size.width,
                height: 70,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                 color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Exsiting",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 17
                    ),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: ()=>Get.to(AddDeliveryType()) ,
              child: Container(
                width: size.width,
                height: 70,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  gradient: AppWidgets.buildLinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Add Delivery Type",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 17
                    ),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: ()=>Get.to(AddProductCategory()),
              child: Container(
                width: size.width,
                height: 70,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Add Product Category",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 17
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
