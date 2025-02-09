import 'package:flutter/material.dart';
import 'package:teste_gdm/app/core/core.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.menu,
          color: GdmTheme.white,
        ),
        ToggleSwitch(
          minWidth: 130,
          changeOnTap: false,
          cornerRadius: 20.0,
          activeBgColors: const [
            [Colors.white],
            [Colors.white]
          ],
          inactiveBgColor: GdmTheme.secondaryRed,
          initialLabelIndex: 0,
          totalSwitches: 2,
          radiusStyle: true,
          customWidgets: [
            Container(
              width: 80,
              height: 40,
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.flash_on_outlined,
                    size: 18,
                    color: GdmTheme.secondaryRed,
                  ),
                  Text(
                    'ir agora',
                    style: TextStyle(
                      color: GdmTheme.secondaryRed,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 40,
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.calendar_today_sharp,
                    size: 16,
                    color: GdmTheme.white,
                  ),
                  Text(
                    'ir outro dia',
                    style: TextStyle(
                      color: GdmTheme.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Icon(
          Icons.search,
          color: GdmTheme.white,
        ),
      ],
    );
  }
}
