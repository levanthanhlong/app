import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../pages/search/search_page.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(10)),
          fillColor: Colors.black,
          suffixIcon: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: GestureDetector(
              onTap: (){
                // Điều hướng đến SearchPage với text nhập vào
                if (_searchController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(
                        text: _searchController.text,
                      ),
                    ),
                  );
                }
              },
              child: const Icon(
                IconlyLight.search,
                color: Colors.white,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          hintText: "Search Courses",
          hintStyle:
          const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
    );
  }
}
