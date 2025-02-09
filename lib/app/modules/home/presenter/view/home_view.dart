import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_gdm/app/core/core.dart';
import 'package:teste_gdm/app/modules/home/home.dart';
import 'package:teste_gdm/app/modules/home/presenter/widget/widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = Modular.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GdmTheme.primaryRed,
      body: Column(
        children: [
          const SizedBox(height: 50),
          const HomeHeaderWidget(),
          FutureBuilder(
            future: viewModel.getAllMotels(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      const CircularProgressIndicator(color: GdmTheme.white),
                      Expanded(child: Container()),
                    ],
                  ),
                );
              }

              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: GdmTheme.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: viewModel.motels.length,
                          itemBuilder: (context, index) {
                            final motel = viewModel.motels[index];

                            return Container(
                              margin: const EdgeInsets.only(left: 14, right: 14),
                              child: Column(
                                children: [
                                  HomeSuiteHeaderInfoWidget(motel: motel),
                                  const SizedBox(height: 18),
                                  if (motel.suites != null && motel.suites!.isNotEmpty) ...{
                                    SizedBox(
                                      height: 550,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics: const PageScrollPhysics(),
                                        itemCount: motel.suites!.length,
                                        itemBuilder: (suitContext, suitIndex) {
                                          final suite = motel.suites![suitIndex];

                                          return HomeSuiteBodyInfoWidget(suite: suite);
                                        },
                                      ),
                                    ),
                                  }
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
