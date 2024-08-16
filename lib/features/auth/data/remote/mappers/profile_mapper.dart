import 'package:sync_center_mobile/features/auth/data/remote/models/profile/profile_dto.dart';

import '../../../../../core/data/remote/api_routes.dart';
import '../../../domain/models/profile.dart';

extension ProfileDtoX on ProfileDto {
  Profile toProfile() => Profile(
        name: name,
        id: id,
        createDate: DateTime.parse(createdDate),
        email: email,
        image: image.isEmpty
            ? ""
            : image.replaceAll("http://192.168.146.1:8000", ApiRoutes.devApi),
      );
}
