import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AbsManager {
//   static const bool _testMode = false;

//   static String get appId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-7831389089863059~6508147530';
//     } else if (Platform.isIOS) {
//       return '----';
//     } else {
//       throw UnsupportedError('Unsupported Platform');
//     }
//   }

//   static String get bannerAdUnitId {
//     if (_testMode == true) {
//       return AdmobBanner.testAdUnitId;
//     } else if (Platform.isAndroid) {
//       return 'ca-app-pub-7831389089863059/3272444259';
//     } else if (Platform.isIOS) {
//       return '----';
//     } else {
//       throw UnsupportedError('Unsupported Platform');
//     }
//   }

// InterstitialAd? _interstitialAd;
// int num_of_attempt_load = 0;

// void createInterAdb() {
//   InterstitialAd.load(
//     adUnitId: 'ca-app-pub-7831389089863059/4385756893',
//     request: AdRequest(),
//     adLoadCallback: InterstitialAdLoadCallback(
//       onAdLoaded: (InterstitialAd ad) {
//         _interstitialAd = ad;
//         num_of_attempt_load = 0;
//       },
//       onAdFailedToLoad: (LoadAdError error) {
//         num_of_attempt_load = num_of_attempt_load + 1;
//         _interstitialAd = null;
//         if (num_of_attempt_load <= 2) {
//           createInterAdb();
//         }
//       },
//     ),
//   );
// }

// void showInterAdb(Widget page) {
//   createInterAdb();
//   if (_interstitialAd == null) {
//     Get.to(() => page);
//     return;
//   }
//   _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//     onAdDismissedFullScreenContent: (InterstitialAd ad) {
//       ad.dispose();

//       Get.to(() => page);
//     },
//     onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//       ad.dispose();
//       createInterAdb();
//     },
//   );

//   _interstitialAd!.show();
//   _interstitialAd = null;
// }
// }

Widget admobBanner = SizedBox(height: 0, width: 0);
