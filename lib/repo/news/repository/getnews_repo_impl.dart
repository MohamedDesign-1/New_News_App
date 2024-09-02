import 'package:injectable/injectable.dart';
import 'package:newnewsapp/models/news_response.dart';

import '../getnews_data_sources.dart';
import '../getnews_repo.dart';


@Injectable(as: GetNewsRepo)
class GetNewsRepoImpl implements GetNewsRepo {

  GetNewsRemoteDataSource remoteDataSource;
  GetNewsRepoImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return remoteDataSource.getNews(sourceId);
  }

}