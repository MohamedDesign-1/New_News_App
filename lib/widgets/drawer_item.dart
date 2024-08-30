import 'package:flutter/material.dart';

import '../style/app_color.dart';
import '../style/app_theme.dart';

class DrawerItem extends StatelessWidget {
  String label ;
  IconData? icon ;
  DrawerItem({required this.label , required this.icon });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon , color: AppColors.greenColor, size: MediaQuery.of(context).size.height * 0.03,),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
          Text(label , style: ThemeApp.lightTheme.textTheme.bodyLarge,),
        ],
      ),
    );
  }
}
