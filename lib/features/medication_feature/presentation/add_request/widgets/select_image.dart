import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({
    super.key,
    required this.title,
    this.image,
    required this.onImageChanged,
  });

  final String title;
  final PlatformFile? image;
  final void Function(PlatformFile) onImageChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          child: TextButton(
            onPressed: () async {
              final path = await selectImage();
              if (path != null) {
                onImageChanged(path);
              }
            },
            child: SizedBox(
              height: 128,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: salamtakShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FittedBox(
                    child: image == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                context.l10n.upload_image,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: lightGreen.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(height: 16),
                              FaIcon(
                                FontAwesomeIcons.arrowUpFromBracket,
                                size: 58,
                                color: lightGreen,
                              )
                            ],
                          )
                        : !kIsWeb
                            ? Image.file(
                                File(image!.path!),
                                fit: BoxFit.cover,
                              )
                            : Image.memory(
                                image!.bytes!,
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<PlatformFile?> selectImage() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (pickedFile != null) {
      final s = pickedFile.files.first;
      return s;
    }
    return null;
  }
}
