import 'package:actiday/framework/controller/home_page_controlller/home_page_conroller.dart';
import 'package:actiday/ui/util/Themes/app_colors.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:actiday/ui/util/widgets/category_card.dart';
import 'package:actiday/ui/util/widgets/common_search_bar.dart';
import 'package:actiday/ui/util/widgets/custom_text.dart';
import 'package:actiday/ui/util/widgets/top_class_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter/services.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomepageMobile extends StatefulWidget {
  const HomepageMobile({super.key});

  @override
  State<HomepageMobile> createState() => _HomepageMobileState();
}

class _HomepageMobileState extends State<HomepageMobile> {

  final CarouselSliderController _controller = CarouselSliderController();
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width= MediaQuery
        .of(context)
        .size
        .width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 40,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SearchBarDemo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 4,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,


                child: Column(
                  children: [
                  CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: HomePageController.modelBanner.length,
                  itemBuilder: (context, index, realIndex) {
                    final banner =HomePageController.modelBanner[index];
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 3,
                          child: Image.network(
                            HomePageController.modelBanner[index].image ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: str_beFit,
                                fontSize: width * 0.07,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text:
                                str_carouselSubtitle,
                                fontSize: width * 0.022,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: 120,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {

                      setState(() => activeIndex = index);
                    },),), const SizedBox(height: 12), AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: HomePageController.modelBanner.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 4, dotWidth: 4, activeDotColor: Colors.blue,),
                  onDotClicked: (index) => _controller.animateToPage(index),),
                ],)
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 0),
            child: Text(
              str_activeLifestyle,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.9,
                  color: Colors.black
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              str_getActiveEveryday,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.9,
                  color: Colors.black
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 0),
            child: Text(
              str_categories,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.9,
                  color: Colors.black
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .width / 8,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 20);
                },
                scrollDirection: Axis.horizontal,
                itemCount: HomePageController.modelCategory.length,
                itemBuilder: (context, index) {
                  final category = HomePageController.modelCategory[index];
                  return CategoryCard(image: category.image ?? '',
                      title: category.categoryName ?? '',
                      heightFactor: 8,
                      widthFactor: 2.29);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(str_topClasees, style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.9,
                    color: Colors.black
                ),
                ),
                Spacer(),
                Text(str_viewAll, style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: clrB5B5B5,
                ),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.separated(itemCount: HomePageController.modelTopClass.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return TopClassCard(
                    image: HomePageController.modelTopClass[index].image ?? '',
                    index: index,
                    title: HomePageController.modelTopClass[index].title ?? '',
                    rating: HomePageController.modelTopClass[index].rating?.toDouble() ?? 0.0,
                    subTitle: HomePageController.modelTopClass[index].subTitle ?? '',
                    address: HomePageController.modelTopClass[index].address ?? '',

                  );
                }),
          ),
        ],
      ),
    );
  }
}
