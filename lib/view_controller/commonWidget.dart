import 'package:crm/utility/utility.dart';
import 'package:flutter/material.dart';


class AppWidget extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final String? appBarTitle;
  final VoidCallback? appBarOnBack;
  final double? textSize;
  const AppWidget({Key? key, required this.body, this.bottomNavigationBar, this.floatingActionButton, this.appBarTitle, this.appBarOnBack, this.textSize = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            backgroundColor: AppColor.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: appBarOnBack,
              icon: Icon(Icons.arrow_back, color: AppColor.black,),
            ),
            title: Text("$appBarTitle",
              style: TextStyle(
                  fontSize: textSize,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
        ),
      ),
    );
  }
}
