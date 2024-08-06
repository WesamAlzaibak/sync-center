import 'package:injectable/injectable.dart';

import '../../../../../core/data/remote/remote_manager.dart';

@injectable
class FileApi {
  final RemoteManager _remoteManager;

  FileApi({required RemoteManager remoteManager})
      : _remoteManager = remoteManager;


}
