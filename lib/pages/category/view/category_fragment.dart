import 'package:flutter/material.dart';
import 'package:newnewsapp/style/app_theme.dart';

import '../../../models/category.dart';
import 'category_item.dart';


class CategoryFragment extends StatelessWidget {
  static const String routeName = 'category_fragment';
  var categories = Category.getCategories();
  Function onCategoryClick;
  CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category\nof interest' , style: ThemeApp.lightTheme.textTheme.bodyLarge,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,), 
          Expanded(
            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){
                    onCategoryClick(categories[index]);
                  },
                  child: CategoryItem(category: categories[index] , index: index));
            },
            itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
