import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart' as m;
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:teste_gdm/app/core/core.dart';
import 'package:teste_gdm/app/modules/home/home.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_gdm/app/modules/home/home_module.dart';
import 'package:http/http.dart' as http;

class MockHomeViewModel extends Mock implements HomeViewModel {}

class MockHomeRepository extends Mock implements HomeRepository {}

class MockHttpClient extends Mock implements http.Client {}

class UriFake extends Fake implements Uri {}

void main() {
  group('HomeView Tests', () {
    late MockHomeViewModel mockHomeViewModel;

    setUpAll(() {
      registerFallbackValue(UriFake());

      mockHomeViewModel = MockHomeViewModel();
      initModule(HomeModule(), replaceBinds: [
        m.Bind.lazySingleton<HomeViewModel>((i) => mockHomeViewModel),
      ]);
    });

    setUp(() {
      dotenv.testLoad(fileInput: "BASE_URL=http://test.com");
    });

    testWidgets('Should display HomeView properly', (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      when(() => mockHomeViewModel.getAllMotels()).thenAnswer((_) async => []);

      await tester.pumpWidget(
        m.ModularApp(
          module: HomeModule(),
          child: const MaterialApp(
            home: HomeView(),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
