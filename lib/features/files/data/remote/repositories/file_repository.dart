import 'package:injectable/injectable.dart';

import '../apis/file_api.dart';

@injectable
class FileRemoteRepository {
  final FileApi _fileApi;

  FileRemoteRepository({required FileApi fileApi})
      : _fileApi = fileApi;

}