import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnewsapp/pages/category/view/category_fragment.dart';
import 'package:newnewsapp/pages/home_screen/home.dart';
import 'package:newnewsapp/pages/news_details/news_details.dart';
import 'package:newnewsapp/pages/search_screen/cubit/search_view_model.dart';
import 'package:newnewsapp/pages/splash_screen/splash_screen.dart';
import 'package:newnewsapp/style/app_theme.dart';
import 'my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchViewModel(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      theme: ThemeApp.lightTheme,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        CategoryFragment.routeName: (context) => CategoryFragment(onCategoryClick: (){},),
        NewsDetails.routeName: (context) => const NewsDetails(),
      },
      ),
    );
  }
}
