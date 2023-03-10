import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageURL;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile({
    Key? key,
    required this.imageURL,
    required this.name,
    this.size = 48,
    this.isNew = false,
    this.isMuted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              child: UserProfileImage(imageURL: imageURL, size: size),
            ),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '🎉',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Icon(CupertinoIcons.mic_slash_fill)),
              ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
