import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/modules.dart';

void main() {
  testWidgets('HomeSuiteHeaderInfoWidget displays information correctly', (tester) async {
    final motel = MotelModel(
      logo: 'https://example.com/logo.png',
      fantasia: 'Test Motel',
      bairro: 'Test Neighborhood',
      media: 4.5,
      qtdAvaliacoes: 100,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeSuiteHeaderInfoWidget(motel: motel),
        ),
      ),
    );

    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('Test Motel'), findsOneWidget);
    expect(find.text('Test Neighborhood'), findsOneWidget);
    expect(find.text('4.5'), findsOneWidget);
    expect(find.text('100 avaliações'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('HomeSuiteHeaderInfoWidget shows default values if data is null', (tester) async {
    final motel = MotelModel(
      logo: null,
      fantasia: null,
      bairro: null,
      media: null,
      qtdAvaliacoes: null,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeSuiteHeaderInfoWidget(motel: motel),
        ),
      ),
    );

    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('Nome não informado'), findsOneWidget);
    expect(find.text('Bairro não informado'), findsOneWidget);
    expect(find.text('0.0'), findsOneWidget);
    expect(find.text('0.0 avaliações'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
