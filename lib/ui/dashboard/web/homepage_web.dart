import 'package:actiday/framework/controller/favourite_controller/favourite_controller.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:actiday/ui/util/custom_text.dart';
import 'package:actiday/ui/util/top_class_card.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../framework/controller/home_page_controlller/home_page_conroller.dart';
import '../../util/category_card.dart';

class HomepageWeb extends StatefulWidget {
  const HomepageWeb({super.key});

  @override
  State<HomepageWeb> createState() => _HomepageWebState();
}

class _HomepageWebState extends State<HomepageWeb> {
  @override
  void initState() {
    super.initState();
    loadHomeJson().then((_){
      if(mounted)setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.035),
              child: Container(
                height: MediaQuery.of(context).size.width / 6.2,
                // width: double.infinity,
                color: Colors.transparent,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: modelBanner.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width / 3,
                          child: Image.network(
                            modelBanner[index].image ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Be Fit",
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text:
                                    "Experts define the physical fitness as one's ability \n to execute daily activity with optimal",
                                fontSize: width * 0.01,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Text(
                str_royalPeaceSpa,
                style: TextStyle(
                  fontSize: width * 0.016,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.9,
                  color: Colors.black,
                ),
              ),
            ),
            CustomText(
              text: str_relaxandrejuvenate,
              fontSize: width * 0.011,
              fontWeight: FontWeight.w600,
              color: Colors.black45,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                str_categories,
                style: TextStyle(
                  fontSize: width * 0.016,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.9,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.width / 8,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: modelCategory.length,
                  itemBuilder: (context, index) {
                    final category = modelCategory[index];
                    return CategoryCard(
                      image: category.image ?? '',
                      title: category.categoryName ?? '',
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Text(
                    str_topClasees,
                    style: TextStyle(
                      fontSize: width * 0.016,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    str_viewAll,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  childAspectRatio: 11 / 8,
                ),
                itemCount: modelTopClass.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TopClassCard(
                    index: index,
                    image: modelTopClass[index].image ?? '',
                    title: modelTopClass[index].title ?? '',
                    rating: modelTopClass[index].rating?.toDouble() ?? 0.0,
                    subTitle: modelTopClass[index].subTitle ?? '',
                    address: modelTopClass[index].address ?? '',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
