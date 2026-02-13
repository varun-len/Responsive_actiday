import 'package:actiday/framework/controller/home_page_controlller/home_page_conroller.dart';
import 'package:actiday/ui/util/Themes/app_colors.dart';
import 'package:actiday/ui/util/top_class_card.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter/services.dart';
import '../../../framework/repository/base_bottom_navbar/models/home_model.dart';
import '../../util/app_constants.dart';
import '../../util/category_card.dart';
import '../../util/common_search_bar.dart';
import '../../util/custom_appbar.dart';


class HomepageMobile extends StatefulWidget {
  const HomepageMobile({super.key});

  @override
  State<HomepageMobile> createState() => _HomepageMobileState();
}

class _HomepageMobileState extends State<HomepageMobile> {
  @override
  void initState() {
    super.initState();
    loadHomeJson();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
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


                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: modelBanner.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Image.network(
                        modelBanner[index].image ?? '', fit: BoxFit.fill,);
                    })
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
                itemCount: modelCategory.length,
                itemBuilder: (context, index) {
                  final category = modelCategory[index];
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
            child: ListView.separated(itemCount: modelTopClass.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return TopClassCard(image: modelTopClass[index].image ?? '',
                      title: modelTopClass[index].title ?? '',
                      rating: modelTopClass[index].rating?.toDouble() ?? 0.0,
                      subTitle: modelTopClass[index].subTitle ?? '',
                      address: modelTopClass[index].address ?? '');
                }),
          ),
        ],
      ),
    );
  }
}
