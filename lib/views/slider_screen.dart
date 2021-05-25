import 'package:aview2/components/items/slider_item.dart';
import 'package:aview2/view_models/providers/slider_provider.dart';
import 'package:aview2/views/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatelessWidget {
  final int slideIndex = 0;
  final List<SliderItem> sliderItemList = [
    SliderItem(
      title: 'Explore',
      description:
          'New places, new restaurants, and more for you to explo \nMake lists of your favoriate places to share it with your favroite people',
      image: 'assets/images/Slider_1.png',
    ),
    SliderItem(
      title: 'Review',
      description:
          'Your opinion matters!\nShare your reviews with the world, and give each place the “stars” they deserve.',
      image: 'assets/images/Slider_2.png',
    ),
    SliderItem(
      title: 'Earn',
      description:
          'We added fun to the reviewing game!\nExchange each review for a point\nExchange your points for bagdes and discounts\nAll in one place.',
      image: 'assets/images/Slider_3.png',
    ),
  ];

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10 : 10,
      width: isCurrentPage ? 40 : 10,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderProvider>(
      builder: (context, SliderProvider value, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            color: Color(0xffffb389),
            child: Stack(
              children: [
                PageView(
                  physics: BouncingScrollPhysics(),
                  controller: value.controller,
                  onPageChanged: (index) {
                    value.changeIndex(index);
                  },
                  children: sliderItemList,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (value.getIndex != 0)
                                    value.controller.animateToPage(
                                        value.getIndex - 1,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInExpo);
                                },
                                child: Visibility(
                                  visible: value.getIndex != 0 ? true : false,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.deepOrange),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 8, 8, 8),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              value.getIndex != sliderItemList.length - 1
                                  ? Container(
                                      child: Row(
                                        children: [
                                          for (int i = 0;
                                              i < sliderItemList.length;
                                              i++)
                                            i == value.getIndex
                                                ? _buildPageIndicator(true)
                                                : _buildPageIndicator(false)
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: value.getIndex !=
                                            sliderItemList.length - 1
                                        ? () {
                                            value.controller.animateToPage(
                                                value.getIndex + 1,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.easeInExpo);
                                          }
                                        : () {
                                            Future.delayed(
                                                Duration.zero,
                                                () => Navigator.pushNamed(
                                                    context, LoginScreenRoute));
                                          },
                                    child: value.getIndex !=
                                            sliderItemList.length - 1
                                        ? Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.deepOrange),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Text(
                                            'Get Started',
                                            style: TextStyle(
                                                fontFamily: 'Lobster',
                                                color: Colors.deepOrange,
                                                fontSize: 25),
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
