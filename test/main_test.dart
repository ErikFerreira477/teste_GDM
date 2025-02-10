import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_gdm/app/app.dart';

class MockDotenv extends Mock {
  Future<void> load({required String fileName}) async {}
  Map<String, String> get env => {'YOUR_ENV_VARIABLE': 'some_value'};
}

void main() {
  late MockDotenv mockDotenv;

  setUp(() {
    mockDotenv = MockDotenv();
  });

  testWidgets('Testing main initialization with mocktail', (WidgetTester tester) async {
    await mockDotenv.load(fileName: ".env");
    expect(mockDotenv.env['YOUR_ENV_VARIABLE'], 'some_value');
    await tester.pumpWidget(ModularApp(module: AppModule(), child: const AppView()));
    expect(find.byType(AppView), findsOneWidget);
  });
}
