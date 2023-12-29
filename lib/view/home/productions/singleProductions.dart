import 'package:crm/appConfig.dart';
import 'package:crm/controller/production_controller/production_controller.dart';
import 'package:crm/model/production_model/single_production_list.dart';
import 'package:crm/utility/app_const.dart';
import 'package:crm/view/appBottomNavigationBar.dart';
import 'package:crm/view/home/productions/edit_translations.dart';
import 'package:crm/view/home/productions/productions.dart';
import 'package:crm/view/home/productions/singleProductionInput.dart';
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:crm/view_controller/detailsTextSideBySide.dart';
import 'package:crm/view_controller/loader.dart';
import 'package:crm/widgets/app_title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/production_model/all_production_model.dart';
import '../../../widgets/app_boxes.dart';


class SingleProductions extends StatefulWidget {
  final AllProductionDatum? productionModel;
  final String id;
  const SingleProductions({Key? key, this.productionModel, required this.id}) : super(key: key);

  @override
  State<SingleProductions> createState() => _SingleProductionsState();
}

class _SingleProductionsState extends State<SingleProductions> {
  Future<SingleProductionModel>? getSingleProductionFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserInfo();
    getSingleProductionFuture = ProductionController.getSingleProduction(id: widget.id!.toString());
  }

  var user_name, user_id, role;
  void _getUserInfo()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      user_id = _pref.getString("user_id");
      user_name = _pref.getString("user_name");
      role = _pref.getString("role");
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppWidget(
      appBarTitle: "Production ID: ${widget. productionModel!.productionId}",
      appBarOnBack: ()=>Get.to(Productoins()),
      body: FutureBuilder<SingleProductionModel>(
        future: getSingleProductionFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: AppLoader(),);
          }else if(snapshot.hasData){
            return SingleChildScrollView(
              padding: EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 30),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Center(child: AppTitleText(text: "Production: ${snapshot.data!.data!.production!.productionId}")),
                  SizedBox(height: 30,),
                  AppSideBySIdeText(leftText: "Date: ", rightText: "${AppConfig.dateFormat(snapshot.data!.data!.production!.productionDate!)}"),
                  SizedBox(height: 20,),
                  AppSideBySIdeText(leftText: "User ID: ", rightText: "${user_id}"),
                  SizedBox(height: 20,),
                  AppSideBySIdeText(leftText: "User Name: ", rightText: "${user_name}"),
                  SizedBox(height: 20,),
                  AppSideBySIdeText(leftText: "Table No: ", rightText: "${widget.productionModel!.tables!.tableId}"),
                  SizedBox(height: 20,),
                  AppSideBySIdeText(leftText: "Assigned to: ", rightText: "${widget.productionModel!.assignedTo!.name}"),
                  SizedBox(height: 30,),

                  Center(child: Text("Total Weight",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),),
                  SizedBox(height: 15,),
                  Center(child: Text("${snapshot.data!.data!.weight.toString()}",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600
                    ),
                  ),),
                  SizedBox(height: 15,),
                  Center(child: Text("KG",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: AppBox(
                      title: "Input",
                      onClick: ()=>Get.to(SingleProductionInput( grades: snapshot.data!.data!.grades, production: widget.productionModel)),
                      width: 180,
                    ),
                  ),
                  SizedBox(height: 20,),
                  role == AppConst.supervisorRole ?  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: ()=>Get.to(EditProductionsTranslation(productionModel: widget.productionModel!,)),
                      child: Container(
                        width: 180,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: AppWidgets.buildLinearGradient(),
                        ),
                        child: const Center(
                          child: Text("Edit Transaction",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 17
                            ),
                          ),
                        ),
                      ),
                    ),
                  ) : Center()

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