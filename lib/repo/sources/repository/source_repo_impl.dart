import 'package:injectable/injectable.dart';
import 'package:newnewsapp/models/SourceResponse.dart';
import 'package:newnewsapp/repo/sources/source_data_sources.dart';

import '../source_repo.dart';

@Injectable(as: SourceRepo)
class SourceRepoImpl implements SourceRepo {

  SourceRemoteDataSource remoteDataSource ;
  SourceRepoImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return remoteDataSource.getSources(categoryId);
  }

}