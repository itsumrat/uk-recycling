import 'package:crm/utility/utility.dart';
import 'package:crm/view/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';


class SFlashScreen extends StatefulWidget {
  const SFlashScreen({Key? key}) : super(key: key);

  @override
  State<SFlashScreen> createState() => _SFlashScreenState();
}

class _SFlashScreenState extends State<SFlashScreen> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [


  ];

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  InkWell _skipButton({void Function(int)? setIndex}) {
    return InkWell(
      borderRadius: defaultSkipButtonBorderRadius,
      onTap: () {
       Get.offAll(SignIn());
      },
      child:  Text(
        'Skip',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.black
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: AppColor.mainColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {},
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: [
          buildPageModel(
            context: context,
            title: "Title comes here",
            subTitile: "Don't miss out our flash sale and daily spclais with great discounts.",
            image: 'assets/images/sf1.jpg'
          ),
          buildPageModel(
              context: context,
              title: "Title comes here",
              subTitile: "Don't miss out our flash sale and daily spclais with great discounts.",
              image: 'assets/images/sf2.jpg'
          ),
          buildPageModel(
              context: context,
              title: "Title comes here",
              subTitile: "Don't miss out our flash sale and daily spclais with great discounts.",
              image: 'assets/images/sf3.jpg'
          ),
        ],
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(
                width: 0.0,
                color: AppColor.white,
              ),
            ),
            child: ColoredBox(
              color: AppColor.white,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child:  index == pagesLength - 1
                    ?  InkWell(
                  onTap: ()=>Get.offAll(SignIn()),
                      child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 50, right: 50),
                  decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                      child: Text("Sign In",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white
                        ),
                      ),
                  ),
                ),
                    )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    index != pagesLength - 1
                        ? _skipButton(setIndex: setIndex)
                        : Center(),
                    CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        activeIndicator: ActiveIndicator(
                          color: AppColor.mainColor,
                        ),
                        indicatorDesign: IndicatorDesign.polygon(
                          polygonDesign: PolygonDesign(
                            polygon: DesignType.polygon_circle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50,)

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  PageModel buildPageModel({
    required BuildContext context,
    required String title,
    required String subTitile,
    required String image,
  }) {
    return PageModel(
          widget: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(
                width: 0.0,
                color: AppColor.mainColor,
              ),
            ),
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                  )
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(

                    ),
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )
                      ),
                      child: Column(
                        children: [
                           Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 30
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                subTitile,
                                //"Don't miss out our flash sale and daily spclais with great discounts.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                    fontSize: 18
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
  }
}
