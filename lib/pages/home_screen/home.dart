import 'package:flutter/material.dart';
import 'package:newnewsapp/models/category.dart';
import 'package:newnewsapp/pages/home_screen/home_drawer.dart';
import 'package:newnewsapp/pages/settings/settings.dart';
import 'package:newnewsapp/pages/search_screen/custom_search.dart';

import '../category/view/category_details.dart';
import '../category/view/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App' ,),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
              context: context,
              delegate: CustomSearch(),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
      ),
      body: selectedItem == HomeDrawer.settings ? Settings() : selectedCategory == null ? CategoryFragment(onCategoryClick: onCategoryItemCLicked,) : CategoryDetails(category: selectedCategory!,)
    );
  }
  Category? selectedCategory;
  void onCategoryItemCLicked(newCategory){
  selectedCategory = newCategory;
  setState(() {});
  }
  int selectedItem = HomeDrawer.categorys;
  void onSideMenuItemClick(int newSelectedItem){
    selectedItem = newSelectedItem;
    selectedCategory = null;
    setState(() {});
  }
}
