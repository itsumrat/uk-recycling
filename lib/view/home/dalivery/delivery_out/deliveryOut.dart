
import 'package:crm/view/appBottomNavigationBar.dart';
import 'package:crm/view/home/dalivery/delivery_out/existing_delivery_out_list.dart';
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../deliveryIn/createNewDelivery.dart';
import '../deliveryIn/existingDeliveries/existingDeliveries.dart';

class DeliveryOut extends StatefulWidget {
  const DeliveryOut({Key? key}) : super(key: key);

  @override
  State<DeliveryOut> createState() => _DeliveryOutState();
}

class _DeliveryOutState extends State<DeliveryOut> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppWidget(
      appBarTitle: "Delivery Out",
      appBarOnBack: ()=>Get.to(AppBottomNavigationBar()),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: size.height*.05,),
            InkWell(
              onTap: ()=>Get.to(AddNewDelivery(isDeliveryOut: false,)),
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
              onTap: ()=>Get.to(ExistingDeliveriesOuts(isIn: false,)),
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

          ],
        ),
      ),
    );
  }
}
