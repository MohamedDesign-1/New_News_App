import 'package:flutter/material.dart';

import '../../style/app_color.dart';
import '../../style/app_theme.dart';
import '../../widgets/drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  static const int categorys = 0;
  static const int settings = 1;
  Function onSideMenuItemClick;
  HomeDrawer({required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text('News App' , style: ThemeApp.lightTheme.textTheme.titleLarge!.copyWith(color: AppColors.whiteColor , fontSize: 25 ),
              textAlign: TextAlign.center,)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          InkWell(
            onTap: (){
              onSideMenuItemClick(categorys);
              Navigator.pop(context);
              },
            child: DrawerItem(
              icon: Icons.list,
              label: 'Categories',
            ),
          ),
          InkWell(
            onTap: (){
              onSideMenuItemClick(settings);
              Navigator.pop(context);
            },
            child: DrawerItem(
              icon: Icons.settings,
              label: 'Settings',
            ),
          ),
        ],
      ),
    );
  }
}
