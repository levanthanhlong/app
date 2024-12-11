import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
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
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              ),
            ),
            child:  Padding(padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:  const BorderSide(
                          width: 0,
                          style: BorderStyle.none
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      fillColor: Colors.black,
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey, borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Icon(IconlyLight.search, color: Colors.white,),
                      ),
                      contentPadding: const EdgeInsets.all(15),
                      hintText: "Search Courses",
                      hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
                          "Hello user,",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22),
                        ),
                        Text(
                          "Learn something new everyday",
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
