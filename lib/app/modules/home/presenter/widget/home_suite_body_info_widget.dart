import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teste_gdm/app/core/core.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';
import 'package:teste_gdm/app/modules/home/presenter/widget/widget.dart';

class HomeSuiteBodyInfoWidget extends StatelessWidget {
  final SuitesModel suite;

  const HomeSuiteBodyInfoWidget({
    super.key,
    required this.suite,
  });

  Future<void> _showFullScreenDialog(BuildContext context, SuitesModel suite) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => HomeExtraPhotosDialogWidget(suite: suite),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 360),
      margin: const EdgeInsets.only(right: 6),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: GdmTheme.white,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                if (suite.fotos != null && suite.fotos!.isNotEmpty) ...{
                  GestureDetector(
                    onTap: () async => await _showFullScreenDialog(context, suite),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl: suite.fotos![0],
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const CircularProgressIndicator(
                          color: GdmTheme.background,
                        ),
                      ),
                    ),
                  )
                } else ...{
                  Container(
                    decoration: BoxDecoration(
                      color: GdmTheme.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        'Foto não disponível',
                        style: TextStyle(
                          color: GdmTheme.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                },
                Text(
                  suite.nome != null && suite.nome != '' ? suite.nome!.formatCorruptedChars() : 'Nome não informado',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    color: GdmTheme.lightGrey,
                  ),
                ),
              ],
            ),
          ),
          if (suite.categoriaItens != null && suite.categoriaItens!.isNotEmpty) ...{
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: GdmTheme.white,
                borderRadius: BorderRadius.circular(4),
              ),
              width: 360,
              margin: const EdgeInsets.only(bottom: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    suite.categoriaItens?.length ?? 0,
                    (i) {
                      if (suite.categoriaItens![i].icone != null && suite.categoriaItens![i].icone != '') {
                        return CachedNetworkImage(
                          imageUrl: suite.categoriaItens![i].icone!,
                          width: 40,
                          height: 40,
                          placeholder: (context, url) => const CircularProgressIndicator(
                            color: GdmTheme.background,
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ),
          },
          if (suite.periodos != null && suite.periodos!.isNotEmpty) ...{
            Column(
              children: List.generate(
                suite.periodos!.length,
                (i) => HomeHourCardWidget(
                  period: suite.periodos![i],
                ),
              ),
            ),
          }
        ],
      ),
    );
  }
}
