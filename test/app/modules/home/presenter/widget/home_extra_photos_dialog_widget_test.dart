import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_gdm/app/modules/modules.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late SuitesModel suite;
  late MockNavigatorObserver mockObserver;

  setUp(() {
    suite = SuitesModel(
      nome: 'Luxury Suite',
      fotos: ['https://example.com/photo1.jpg', 'https://example.com/photo2.jpg'],
    );
    mockObserver = MockNavigatorObserver();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      navigatorObservers: [mockObserver],
      home: Scaffold(
        body: Builder(
          builder: (context) => TextButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => HomeExtraPhotosDialogWidget(suite: suite),
            ),
            child: const Text('Open Dialog'),
          ),
        ),
      ),
    );
  }

  testWidgets('displays photos correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text('Open Dialog'));
    await tester.pumpAndSettle();

    for (final photo in suite.fotos!) {
      expect(
          find.byWidgetPredicate((widget) => widget is CachedNetworkImage && widget.imageUrl == photo), findsOneWidget);
    }
  });

  testWidgets('closes when back button is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text('Open Dialog'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_sharp));
    await tester.pumpAndSettle();

    expect(find.byType(Dialog), findsNothing);
  });
}
