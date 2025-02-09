import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teste_gdm/app/core/core.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

class HomeSuiteHeaderInfoWidget extends StatelessWidget {
  final MotelModel motel;

  const HomeSuiteHeaderInfoWidget({
    super.key,
    required this.motel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: motel.logo ?? '',
            width: 68,
            height: 68,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: GdmTheme.background,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              motel.fantasia != null && motel.fantasia != ''
                  ? motel.fantasia!.formatCorruptedChars()
                  : 'Nome não informado',
              style: const TextStyle(
                fontSize: 22,
                color: GdmTheme.darkGrey,
              ),
            ),
            Text(
              motel.bairro != null && motel.bairro != ''
                  ? motel.bairro!.formatCorruptedChars()
                  : 'Bairro não informado',
              style: const TextStyle(
                fontSize: 12,
                color: GdmTheme.darkGrey,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: GdmTheme.yellow,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: GdmTheme.yellow,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        motel.media != null ? motel.media.toString() : '0.0',
                        style: const TextStyle(
                          fontSize: 12,
                          color: GdmTheme.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Row(
                  children: [
                    Text(
                      '${motel.qtdAvaliacoes != null ? motel.qtdAvaliacoes.toString() : '0.0'} avaliações',
                      style: const TextStyle(
                        fontSize: 12,
                        color: GdmTheme.black,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: GdmTheme.black,
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Expanded(child: Container()),
        const Icon(
          Icons.favorite,
          color: GdmTheme.grey,
          size: 28,
        ),
      ],
    );
  }
}
