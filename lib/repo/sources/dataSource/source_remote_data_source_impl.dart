import 'package:injectable/injectable.dart';
import 'package:newnewsapp/api/api_manger.dart';
import 'package:newnewsapp/models/SourceResponse.dart';
import '../source_data_sources.dart';

@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManger apiManger = ApiManger();
  SourceRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManger.getSources(categoryId);
    return response;
  }

}
