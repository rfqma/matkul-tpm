import 'package:flutter/material.dart';
import 'package:tugas_akhir/widgets/cat/horizontally_scroll_items.dart';
import 'package:sizer/sizer.dart';

import 'package:tugas_akhir/models/catModels/cat_model.dart';

class Categories extends StatelessWidget {
  final Cat cat;
  const Categories({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List categories = [
      cat.adaptability,
      cat.intelligence,
      cat.rare,
      cat.hypoallergenic
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: ((context, index) => horisontallyScrollableItems(
                  index,
                  categories,
                ))),
      ),
    );
  }
}
