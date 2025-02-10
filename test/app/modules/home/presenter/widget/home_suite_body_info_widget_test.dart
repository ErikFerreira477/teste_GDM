import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/modules.dart';

void main() {
  testWidgets('should display suite name, image, categories, and periods', (WidgetTester tester) async {
    final suite = SuitesModel(
      nome: 'Suite Test',
      fotos: ['https://example.com/photo.jpg'],
      categoriaItens: [CategoriaItensModel(nome: 'Category', icone: 'https://example.com/icon.jpg')],
      periodos: [PeriodosModel(tempoFormatado: '1 hour', valor: 100.0, valorTotal: 90.0)],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeSuiteBodyInfoWidget(suite: suite),
        ),
      ),
    );

    expect(find.text('Suite Test'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsNWidgets(2));
    expect(find.text('1 hour'), findsOneWidget);
  });

  testWidgets('should display placeholder text when no image is available', (WidgetTester tester) async {
    final suite = SuitesModel(
      nome: 'Suite Test',
      fotos: [],
      categoriaItens: [],
      periodos: [],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeSuiteBodyInfoWidget(suite: suite),
        ),
      ),
    );

    expect(find.text('Foto não disponível'), findsOneWidget);
  });

  testWidgets('should display "Nome não informado" when no name is provided', (WidgetTester tester) async {
    final suite = SuitesModel(
      nome: '',
      fotos: [],
      categoriaItens: [],
      periodos: [],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeSuiteBodyInfoWidget(suite: suite),
        ),
      ),
    );

    expect(find.text('Nome não informado'), findsOneWidget);
  });

  testWidgets('should trigger onTap on GestureDetector', (WidgetTester tester) async {
    final suite = SuitesModel(
      nome: 'Suite Test',
      fotos: ['https://example.com/photo.jpg'],
      categoriaItens: [],
      periodos: [],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeSuiteBodyInfoWidget(suite: suite),
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(HomeExtraPhotosDialogWidget), findsOneWidget);
  });
}
