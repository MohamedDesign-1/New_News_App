import 'dart:ui';

import 'package:newnewsapp/style/app_color.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color color;

  Category({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.color,
  }
  );

  static List<Category> getCategories(){
    return [
      Category(
        id: 'business',
        title: 'Business',
        imagePath: 'assets/images/bussines.png',
        color: CategoryColor.categoryColorBrown,
      ),
      Category(
        id: 'entertainment',
        title: 'Entertainment',
        imagePath: 'assets/images/environment.png',
        color: CategoryColor.categoryColorBlue,
      ),
      Category(
        id: 'sports',
        title: 'Sports',
        imagePath: 'assets/images/NewsTest.png',
        color: CategoryColor.categoryColorRed,
      ),
      Category(
        id: 'health',
        title: 'Health',
        imagePath: 'assets/images/health.png',
        color: CategoryColor.categoryColorPink,
      ),
      Category(
        id: 'science',
        title: 'Science',
        imagePath: 'assets/images/science.png',
        color: CategoryColor.categoryColorYellow,
      ),
      Category(
        id: 'technology',
        title: 'Technology',
        imagePath: 'assets/images/Politics.png',
        color: CategoryColor.categoryColorDarkBlue,
      ),
    ];
  }
}