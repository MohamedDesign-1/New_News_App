
import '../../models/news_response.dart';

abstract class GetNewsRepo {
  Future<NewsResponse?> getNews(String sourceId);
}