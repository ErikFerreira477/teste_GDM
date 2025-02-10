import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teste_gdm/app/modules/modules.dart';

class MockHttpClient extends Mock implements http.Client {}

class UriFake extends Fake implements Uri {}

void main() {
  late HomeService homeService;
  late MockHttpClient mockHttpClient;

  setUpAll(() {
    registerFallbackValue(UriFake());
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    homeService = HomeService();
    dotenv.testLoad(fileInput: "BASE_URL=http://test.com");
  });

  test('getAllMotels returns GetAllMotelsModel on success', () async {
    const responseJson = '{"motels": []}';

    when(() => mockHttpClient.get(any())).thenAnswer(
      (_) async => http.Response(responseJson, 200),
    );

    final result = await homeService.getAllMotels();

    expect(result, isA<GetAllMotelsModel>());
  });
}
