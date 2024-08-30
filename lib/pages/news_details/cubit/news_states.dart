import 'package:newnewsapp/models/news_response.dart';

abstract class NewsStates{}

class NewsLoadingState extends NewsStates{}
class NewsErrorState extends NewsStates{
  String error;
  NewsErrorState(this.error);
}
class NewsSuccessState extends NewsStates{
  List<News> newsList;
  NewsSuccessState(this.newsList);
}

