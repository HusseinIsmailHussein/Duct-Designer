import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../II widgets/0- appbar/onboarding_page.dart';
import 'dashboard_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = PageController();
  bool isLastPage = false;
  final prefs = SharedPreferences.getInstance();
  final counter = 4;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == counter - 1;
            });
          },
          children: [
            OnBoardingPage(
                headLine: 'Calculate',
                imageLink: 'calculate.png',
                summary:
                    'Calculate duct items area and weight according to selected sheet metal material and thickness',
                backgroundColor: Colors.grey.shade800,
                textColor: Colors.white),
            OnBoardingPage(
                headLine: 'Dimensions',
                imageLink: 'dimensions.png',
                summary:
                    'Units dimensions can be converted between SI and british units',
                backgroundColor: Colors.white,
                textColor: Colors.black),
            OnBoardingPage(
                headLine: 'Sheet Metal',
                imageLink: 'sheet_metal.jpg',
                summary:
                    'Sheet metal materials weight can be customized according to supplier specification',
                backgroundColor: Colors.grey.shade800,
                textColor: Colors.white),
            OnBoardingPage(
                headLine: 'Projects',
                imageLink: 'projects.png',
                summary:
                    'Items are saved in a project and project summary data sheet will be generated for each project includes total area and total weight',
                backgroundColor: Colors.orange,
                textColor: Colors.black),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              height: 80,
              child: TextButton(
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                onPressed: () {
                  prefs.then((value) => value.setBool('showHome', true));
                  Get.to(DashboardView());
                },
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('SKIP'),
                    onPressed: () {
                      controller.jumpToPage(counter - 1);
                    },
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: counter,
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                    ),
                  ),
                  TextButton(
                    child: const Text('NEXT'),
                    onPressed: () {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
