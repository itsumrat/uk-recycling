import 'package:crm/controller/production_controller/production_controller.dart';
import 'package:crm/model/production_model/all_production_model.dart';
import 'package:crm/utility/utility.dart';
import 'package:crm/view/appBottomNavigationBar.dart';
import 'package:crm/view/home/dalivery/deliveryIn/deliveryIn.dart';
import 'package:crm/view/home/dalivery/deliveryIn/existingDeliveries/singleExistingDeliveries.dart';
import 'package:crm/view/home/productions/singleProductions.dart';
import 'package:crm/view_controller/appWidgets.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:crm/view_controller/loader.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';


class Productoins extends StatefulWidget {
  const Productoins({Key? key}) : super(key: key);

  @override
  State<Productoins> createState() => _ProductoinsState();
}

class _ProductoinsState extends State<Productoins> {

  List<AllProductionDatum> _allProductionList = [];
  List<AllProductionDatum> _allSearchProductionList = [];
  bool isLoading = false;
  Future<void> _getAllProductionList()async{
    setState(() =>isLoading = true);
    var allProduction = await ProductionController.getAllProduction();
    for(var i in allProduction.data!){
      setState(() {
        _allProductionList.add(i);
      });
    }
    setState(() =>isLoading = false);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllProductionList();
  }


  @override
  Widget build(BuildContext context) {
    return AppWidget(
      appBarOnBack: ()=>Get.to(AppBottomNavigationBar()),
      appBarTitle: "Productions",
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child:  TextFormField(
                      onChanged: (v){
                        _search(v.toLowerCase());
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          hintText: "Search"
                      ),
                    )
                ),
                SizedBox(width: 15,),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: AppWidgets.buildLinearGradient()
                  ),
                  child: Center(
                    child: Text("Search",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Expanded(
                child: isLoading
                    ? Center(child: AppLoader(),)
                    : _allSearchProductionList.isNotEmpty
                    ? ListView.builder(
                    itemCount: _allSearchProductionList.length,
                    itemBuilder: (_, index){
                      var data = _allSearchProductionList[index];
                      return InkWell(
                        onTap: ()=>Get.to(SingleProductions(productionModel: data, id: data.id.toString(),)),
                        child: Container(
                          //height: 50,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(5),
                              border: Border(
                                top: BorderSide(width: 1, color: AppColor.borderColor),
                                left: BorderSide(width: 1, color: AppColor.borderColor),
                                right: BorderSide(width: 1, color: AppColor.borderColor),
                                bottom: _allProductionList.length ==1? BorderSide(width: 1, color: AppColor.borderColor) : BorderSide.none,
                              )
                          ),
                          child: Text("${data.productionId}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                                fontSize: 16
                            ),
                          ),
                        ),
                      );
                    }
                )
                    :  _allProductionList.isNotEmpty
                    ? ListView.builder(
                    itemCount: _allProductionList.length,
                    itemBuilder: (_, index){
                      var data = _allProductionList[index];
                      return InkWell(
                        onTap: ()=>Get.to(SingleProductions(productionModel: data, id: data.id.toString(),)),
                        child: Container(
                          //height: 50,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(5),
                              border: Border(
                                top: BorderSide(width: 1, color: AppColor.borderColor),
                                left: BorderSide(width: 1, color: AppColor.borderColor),
                                right: BorderSide(width: 1, color: AppColor.borderColor),
                                bottom: _allProductionList.length ==1? BorderSide(width: 1, color: AppColor.borderColor) : BorderSide.none,
                              )
                          ),
                          child: Text("${data.productionId}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                                fontSize: 16
                            ),
                          ),
                        ),
                      );
                    }
                )
                    : const Center(child: Text("No production found."),)
            ),
          ],
        ),
      ),
    );
  }



  //search list
  void _search(String query) {
    print("query == $query");
    _allSearchProductionList!.clear();
    if(query.isNotEmpty){
      for(var i in _allProductionList!){
        if(i.productionId!.toLowerCase().contains(query)){
          setState(() {
            _allSearchProductionList?.add(i);
          });
        }
      }
      print("_allSearchProductionList == ${_allSearchProductionList.length}");
    }else{
      _allSearchProductionList!.clear();
    }
    setState(() {

    });
  }
}
