import '../../models/news_response.dart';

abstract class GetNewsRemoteDataSource {
  Future<NewsResponse?> getNews(String sourceId);
}

abstract class GetNewsLocalDataSource {}