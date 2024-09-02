import '../../../models/news_response.dart';

abstract class SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchErrorState extends SearchStates {
  String error;
  SearchErrorState(this.error);
}

class SearchSuccessState extends SearchStates {
  List<News> newsList;
  SearchSuccessState(this.newsList);
}
