import 'package:crm/controller/attendance_controller/attendance_controller.dart';
import 'package:crm/model/attendance_model/attendance_model.dart';
import 'package:crm/utility/utility.dart';
import 'package:crm/view_controller/commonWidget.dart';
import 'package:crm/view_controller/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../view_controller/appWidgets.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({Key? key}) : super(key: key);

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {

  List<Datum>  _allAttendanceList = [];
  List<Datum>  _searchAllAttendanceList = [];

  final date = TextEditingController();

  var formetDate = DateFormat("yyyy-MM-dd");
  bool  isLoading = false;
  getAllAttendance()async{
    setState(() =>isLoading = true);
    var res = await AttendnaceController.getAllAttandenceList();
    for(var i in res.data!){

      print("i.date == ${i.date}");
      print("i.date == ${formetDate.format(DateTime.parse("${i.date.toString()}"))}");
      if(formetDate.format(DateTime.now()).toString() == formetDate.format(DateTime.parse("${i.date.toString()}")).toString() ){
        setState(() {
          _allAttendanceList.add(i);
        });
      }


    }
    setState(() =>isLoading = false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllAttendance();

  }

  @override
  Widget build(BuildContext context) {
    return AppWidget(
      appBarTitle: "User Attendance",
      appBarOnBack: ()=>Get.back(),
      body: isLoading ? Center(child: AppLoader(),) : SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                      child:  TextFormField(
                        //readOnly: true,
                        //onTap: ()=> selectDate(context),
                        controller: date,
                        onChanged: (v){
                          _search(v!.toLowerCase());
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: "Select"
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
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: MediaQuery.of(context).size.height-150,
              child: Builder(
                builder: (context) {
                  return _searchAllAttendanceList.isNotEmpty
                      ?  ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchAllAttendanceList.length,
                      itemBuilder: (_, index){
                        return InkWell(
                          child: Container(
                            //height: 50,
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.30,
                                  child: Text("${_searchAllAttendanceList[index]!.user!.name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 16
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Text("${_searchAllAttendanceList[index]!.checkIn} - ${_searchAllAttendanceList[index]!.checkOut??""}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.textColor,
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                SizedBox(
                                  child: InkWell(
                                    // onTap: ()=>Get.to(EditTranscation()),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
                                      decoration: BoxDecoration(
                                          color: index.isEven ? Colors.red : Colors.green,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Text("${index.isEven ? "A" : "P"}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 16
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
                  )
                      : _allAttendanceList.isNotEmpty
                      ? ListView.builder(
                    shrinkWrap: true,
                      itemCount: _allAttendanceList.length,
                      itemBuilder: (_, index){
                        return InkWell(
                          child: Container(
                            //height: 50,
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.30,
                                  child: Text("${_allAttendanceList[index]!.user!.name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 16
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Text("${_allAttendanceList[index]!.checkIn} - ${_allAttendanceList[index]!.checkOut??""}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.textColor,
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                SizedBox(
                                  child: InkWell(
                                   // onTap: ()=>Get.to(EditTranscation()),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
                                      decoration: BoxDecoration(
                                          color: index.isEven ? Colors.red : Colors.green,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Text("${index.isEven ? "A" : "P"}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 16
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
                  )
                      : Center(child: Text("No data found"),);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  //select date
  Future<void> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      print("Selected date: ${DateFormat('yyyy-MM-dd').format(picked)}");
      setState(() {
        date.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }


  //search list
  void _search(String query) {
    print("query == $query");
    _searchAllAttendanceList.clear();

    if(query.isNotEmpty){
      _searchAllAttendanceList.clear();
      for(var i in _allAttendanceList!){
        if(i.user!.name!.toLowerCase().contains(query)){
          setState(() {
            _searchAllAttendanceList.add(i);
          });
        }
      }
    }else{

    }
  }
}