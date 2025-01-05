import 'package:app/data/category_data.dart';
import 'package:app/pages/home/widget/all_courses/all_courses_widget.dart';
import 'package:app/pages/home/widget/new_courses/new_courses_widget.dart';
import 'package:app/widgets/category_icon.dart';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../widgets/header_text_field.dart';
import '../../widgets/search_box.dart';
import '../../widgets/tag.dart';
import '../category/category_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SearchBox(),
                  const SizedBox(
                    height: 10,
                  ),
                  HeaderTextField(title: 'Category'),
                  const SizedBox(
                    height: 10,
                  ),
                  categorySlider(),
                  const SizedBox(
                    height: 10,
                  ),
                  HeaderTextField(
                    title: 'All courses for you',
                    child: Tag(title: "Let's go!"),
                  ),
                  const AllCoursesWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  HeaderTextField(
                    title: 'New courses',
                    child: Tag(title: "new"),
                  ),
                  const NewCoursesWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container categorySlider() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryData.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(
                        category: categoryData[index].categoryTitle),
                  ),
                );
              },
              child: CategoryIcon(category: categoryData[index]));
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
        backgroundColor: Colors.black,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22),
                        ),
                        Text(
                          "Learn something new everyday with Moon",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 14),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          margin: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurStyle: BlurStyle.outer)
                              ]),
                          child: const Icon(
                            IconlyLight.notification,
                            size: 26,
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 8,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
