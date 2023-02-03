import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ring_sizer/ring_size_data.dart';

class SliderController extends GetxController {
  var sliderValue = 1.0.obs;
  final minSize = 12.0 * 3.8;
  final maxSize = 40 * 3.8;
  final color1 = const Color(0xFFffc3a1);
  final color2 = const Color(0xFFA75D5D);

  final List<RingSizeData> allRingSizes = [];

  int get indexOfSize {
    int sizeIndex = 0;
    allRingSizes.asMap().forEach((index, value) {
      if ((sliderValue.value - 50) <= (value.diameter * 3.8) &&
          sizeIndex == 0) {
        sizeIndex = index;
      }
      return;
    });
    return sizeIndex;
  }

  _initAllRingSize() {
    allRingSizes.add(RingSizeData(12.04, 12, 38, 'A', 0.5));
    allRingSizes.add(RingSizeData(12.45, 12.5, 39, 'B', 1));
    allRingSizes.add(RingSizeData(12.85, 13, 40, 'C', 1.5));
    allRingSizes.add(RingSizeData(13.26, 13, 42, 'D', 2));
    allRingSizes.add(RingSizeData(13.67, 13.5, 43, 'E', 2.5));
    allRingSizes.add(RingSizeData(14.07, 14, 44, 'F', 3));
    allRingSizes.add(RingSizeData(14.48, 14.5, 45, 'G', 3.5));
    allRingSizes.add(RingSizeData(14.88, 15, 47, 'H', 4));
    allRingSizes.add(RingSizeData(15.29, 15, 48, 'I', 4.5));
    allRingSizes.add(RingSizeData(15.49, 15.5, 49, 'J', 5));
    allRingSizes.add(RingSizeData(15.90, 16, 50, 'K', 5.5));
    allRingSizes.add(RingSizeData(16.31, 16, 51, 'L', 6));
    allRingSizes.add(RingSizeData(16.71, 16.5, 52, 'M', 6.5));
    allRingSizes.add(RingSizeData(17.12, 17, 54, 'N', 7));
    allRingSizes.add(RingSizeData(17.53, 17.5, 55, 'O', 7.5));
    allRingSizes.add(RingSizeData(17.93, 18, 56, 'P', 8));
    allRingSizes.add(RingSizeData(18.34, 18, 58, 'Q', 8.5));
    allRingSizes.add(RingSizeData(18.75, 18.5, 59, 'R', 9));
    allRingSizes.add(RingSizeData(19.15, 19, 60, 'S', 9.5));
    allRingSizes.add(RingSizeData(19.56, 19.5, 61, 'T', 10));
    allRingSizes.add(RingSizeData(19.96, 20, 63, 'U', 10.5));
    allRingSizes.add(RingSizeData(20.37, 20, 64, 'V', 11));
    allRingSizes.add(RingSizeData(20.78, 20.5, 65, 'W', 11.5));
    allRingSizes.add(RingSizeData(21.18, 21, 67, 'C', 12));
    allRingSizes.add(RingSizeData(21.59, 21.5, 68, 'Y', 12.5));
    allRingSizes.add(RingSizeData(21.79, 22, 69, 'Z', 13));
  }

  @override
  void onInit() {
    super.onInit();
    sliderValue.value = minSize;
    _initAllRingSize();
  }
}
