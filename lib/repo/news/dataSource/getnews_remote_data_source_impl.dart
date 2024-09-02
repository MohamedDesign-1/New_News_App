import 'package:injectable/injectable.dart';
import 'package:newnewsapp/models/news_response.dart';

import '../../../api/api_manger.dart';
import '../getnews_data_sources.dart';

@Injectable(as: GetNewsRemoteDataSource)
class GetNewsRemoteDataSourceImpl implements GetNewsRemoteDataSource {

  ApiManger apiManger ;
  GetNewsRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<NewsResponse?> getNews(String sourceId) async {
  var response = await apiManger.getNewsBySourceId(sourceId);
  return response;
  }

}
