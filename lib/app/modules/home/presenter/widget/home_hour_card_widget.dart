import 'package:flutter/material.dart';
import 'package:teste_gdm/app/core/core.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';

class HomeHourCardWidget extends StatelessWidget {
  final PeriodosModel period;

  const HomeHourCardWidget({
    super.key,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    bool hasDiscount = period.desconto?.desconto != null && period.desconto!.desconto! > 0.0;
    bool canCalculeDiscount = period.valor != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: GdmTheme.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    period.tempoFormatado ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      color: GdmTheme.lightGrey,
                    ),
                  ),
                  if (hasDiscount && canCalculeDiscount) ...{
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: GdmTheme.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: GdmTheme.primaryGreen,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        '${((period.desconto!.desconto! / period.valor!) * 100).round()}% off',
                        style: const TextStyle(
                          color: GdmTheme.primaryGreen,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  },
                ],
              ),
              Row(
                children: [
                  Text(
                    period.valor.toString().toBRL(),
                    style: TextStyle(
                      decoration: hasDiscount && canCalculeDiscount ? TextDecoration.lineThrough : null,
                      decorationColor: hasDiscount && canCalculeDiscount ? GdmTheme.grey : null,
                      fontSize: 14,
                      color: hasDiscount && canCalculeDiscount ? GdmTheme.grey : GdmTheme.lightGrey,
                    ),
                  ),
                  if (hasDiscount && canCalculeDiscount) ...{
                    Text(
                      period.valorTotal.toString().toBRL(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: GdmTheme.lightGrey,
                      ),
                    ),
                  }
                ],
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: GdmTheme.grey,
            size: 16,
          ),
        ],
      ),
    );
  }
}
