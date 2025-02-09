import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teste_gdm/app/core/core.dart';
import 'package:teste_gdm/app/modules/home/home.dart';

class HomeExtraPhotosDialogWidget extends StatelessWidget {
  final SuitesModel suite;

  const HomeExtraPhotosDialogWidget({
    super.key,
    required this.suite,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: GdmTheme.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: List.generate(
                  suite.fotos!.length,
                  (i) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      child: CachedNetworkImage(imageUrl: suite.fotos![i]),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: GdmTheme.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_sharp, size: 16),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      suite.nome!.formatCorruptedChars(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: GdmTheme.darkGrey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
