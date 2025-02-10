import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_gdm/app/modules/modules.dart';

void main() {
  testWidgets('HomeHourCardWidget displays period info correctly', (WidgetTester tester) async {
    final period = PeriodosModel(
      tempoFormatado: '1 hour',
      valor: 100.0,
      valorTotal: 90.0,
      desconto: DescontoModel(desconto: 10.0),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeHourCardWidget(period: period),
        ),
      ),
    );

    expect(find.text('1 hour'), findsOneWidget);
    expect(find.text('R\$ 100,00'), findsOneWidget);
    expect(find.text('R\$ 90,00'), findsOneWidget);
    expect(find.text('10% off'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios_rounded), findsOneWidget);
  });
}
