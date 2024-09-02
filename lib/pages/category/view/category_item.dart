import 'package:flutter/material.dart';
import 'package:newnewsapp/models/category.dart';

import '../../../style/app_color.dart';
import '../../../style/app_theme.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  CategoryItem({required this.category , required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(
              index % 2 != 0 ? 25 : 0
          ),
        ),
      ),
      child: Column(
        children: [
          Image.asset(category.imagePath , height: MediaQuery.of(context).size.height * 0.15,),
          Text(category.title , style:ThemeApp.lightTheme.textTheme.titleLarge!.copyWith(color: AppColors.whiteColor), textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
