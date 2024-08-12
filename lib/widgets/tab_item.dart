import 'package:flutter/material.dart';
import 'package:newnewsapp/style/app_color.dart';
import 'package:newnewsapp/style/app_theme.dart';

import '../models/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Sources source;
  TabItem({Key? key, required this.isSelected , required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? AppColors.greenColor : AppColors.greenColor,
          width: 3 ,
        ),
        color: isSelected ? AppColors.greenColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(source.name ?? "" , style: ThemeApp.lightTheme.textTheme.titleMedium?.copyWith(
      color: isSelected ? AppColors.whiteColor : AppColors.blackColor
      ),),
    );
  }
}
