import '../../models/SourceResponse.dart';


abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSources(String categoryId);
}

abstract class SourceLocalDataSource {}