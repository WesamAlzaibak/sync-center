import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/ui/reusables/images/sync_network_image.dart';
import '../../../../core/ui/theme/colors.dart';

class ProfileImageComponent extends StatelessWidget {
  const ProfileImageComponent(
      {super.key,
      required this.image,
      required this.name,
      required this.onChangePicClick});

  final String image;
  final String name;
  final void Function(XFile?) onChangePicClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 60,
            child: CircleAvatar(
              radius: 56,
              child: image.isEmpty
                  ? Center(
                      child: Text(
                        name[0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: SyncColors.darkBlue,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: SyncNetworkImage(
                        imageUrl: image,
                        width: 112.0,
                        height: 112.0,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          InkWell(
              borderRadius: BorderRadius.circular(34),
              onTap: () async {
                final imageFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                onChangePicClick(imageFile);
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: SyncColors.lightBlue,
                child: Icon(
                  Icons.edit,
                  size: 25,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
