import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ring_sizer/slider_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(SliderController());
    const cellWidth = 60.0;
    const graphSize = 200.0;
    final ItemScrollController itemScrollController = ItemScrollController();

    final lightVerticalDivider = VerticalDivider(
      width: 0.3,
      color: ctr.color1,
      thickness: 0.3,
    );

    final darkVerticalDivider = VerticalDivider(
      width: 1,
      color: ctr.color2,
      thickness: 1,
    );

    final lightHorizontalDivider = Divider(
      height: 0.3,
      color: ctr.color1,
      thickness: 0.3,
    );

    final darkHorizontalDivider = Divider(
      height: 1,
      color: ctr.color2,
      thickness: 1,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 38),
            Row(
              children: [
                Container(
                  height: graphSize,
                  width: graphSize,
                  margin: const EdgeInsets.only(left: 16),
                  color: Colors.white,
                  child: SizedBox(
                    height: ctr.maxSize,
                    width: ctr.maxSize,
                    child: Obx(
                      () {
                        final sliderValue = ctr.sliderValue.value;
                        final distanceFromCenter =
                            (graphSize / 2) - (sliderValue / 2);
                        return Stack(
                          children: [
                            Positioned(
                              left: 0,
                              child: SizedBox(
                                height: graphSize,
                                width: distanceFromCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      (distanceFromCenter ~/ 5),
                                      (_) => lightVerticalDivider,
                                    ),
                                    darkVerticalDivider,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: (graphSize / 2) - distanceFromCenter * 2,
                              child: SizedBox(
                                height: graphSize,
                                width: distanceFromCenter * 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      (distanceFromCenter ~/ 2.5),
                                      (_) => lightVerticalDivider,
                                    ),
                                    darkVerticalDivider,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: SizedBox(
                                height: graphSize,
                                width: distanceFromCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    darkVerticalDivider,
                                    ...List.generate(
                                      (distanceFromCenter ~/ 5),
                                      (_) => lightVerticalDivider,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: (graphSize / 2) - distanceFromCenter * 2,
                              child: SizedBox(
                                height: graphSize,
                                width: distanceFromCenter * 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      (distanceFromCenter ~/ 2.5),
                                      (_) => lightVerticalDivider,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: (graphSize / 2) - distanceFromCenter * 2,
                              child: SizedBox(
                                height: distanceFromCenter * 2,
                                width: graphSize,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      (distanceFromCenter ~/ 5),
                                      (_) => lightHorizontalDivider,
                                    ),
                                    darkHorizontalDivider,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              child: SizedBox(
                                height: distanceFromCenter,
                                width: graphSize,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      (distanceFromCenter ~/ 5),
                                      (_) => lightHorizontalDivider,
                                    ),
                                    darkHorizontalDivider,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: SizedBox(
                                height: distanceFromCenter,
                                width: graphSize,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    darkHorizontalDivider,
                                    ...List.generate(
                                      (distanceFromCenter ~/ 5),
                                      (_) => lightHorizontalDivider,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: (graphSize / 2) - distanceFromCenter * 2,
                              child: SizedBox(
                                height: distanceFromCenter * 2,
                                width: graphSize,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                      (distanceFromCenter ~/ 5),
                                      (_) => lightHorizontalDivider,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: sliderValue,
                                width: sliderValue,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    sliderValue / 2,
                                  ),
                                  border: Border.all(
                                    width: 2,
                                    color: ctr.color2,
                                  ),
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              color: ctr.color2,
                                              height: 1,
                                              thickness: 1,
                                            ),
                                          ),
                                          Text(
                                            '${(sliderValue / 38 * 10).toStringAsFixed(2)} mm',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w200,
                                              color: ctr.color2,
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              color: ctr.color2,
                                              height: 1,
                                              thickness: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        left: 0,
                                        child: Icon(
                                          Icons.arrow_back_rounded,
                                          size: 12,
                                          color: ctr.color2,
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: Icon(
                                          Icons.arrow_forward_rounded,
                                          size: 12,
                                          color: ctr.color2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Put the ring on the circle to determine its size. Use the slider below to measure the size of the ring and refer the table for exact size.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 18),
            Obx(
              () => Slider(
                min: ctr.minSize,
                max: ctr.maxSize,
                activeColor: ctr.color2,
                inactiveColor: ctr.color1,
                value: ctr.sliderValue.value,
                onChanged: (value) {
                  ctr.sliderValue.value = value;
                  itemScrollController.jumpTo(
                    index: ctr.indexOfSize,
                    alignment: 0.5,
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              color: ctr.color1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: cellWidth,
                    child: Text(
                      'Diameter\nmm',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: cellWidth,
                    child: Text(
                      'Ring size',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: cellWidth,
                    child: Text(
                      'Ring size\nEU',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: cellWidth,
                    child: Text(
                      'Ring size\nUK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: cellWidth,
                    child: Text(
                      'Ring size\nUSA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ScrollablePositionedList.builder(
                itemCount: ctr.allRingSizes.length,
                physics: const BouncingScrollPhysics(),
                itemScrollController: itemScrollController,
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      final size = ctr.allRingSizes[index];
                      final bool isSelectedSize = index == ctr.indexOfSize;
                      print('ctr.sliderValue.value ${ctr.sliderValue.value}');
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelectedSize
                              ? ctr.color1.withOpacity(0.5)
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: cellWidth,
                              child: Text(
                                '${size.diameter}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: Text(
                                '${size.ringSize}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: Text(
                                '${size.ringSizeEU}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: Text(
                                size.ringSizeUK,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: Text(
                                '${size.ringSizeUSA}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
