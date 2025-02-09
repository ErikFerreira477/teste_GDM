import 'package:http/http.dart';
import 'package:teste_gdm/app/modules/home/models/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeService {
  Future<GetAllMotelsModel> getAllMotels() async {
    await dotenv.load();
    String baseUrl = dotenv.env['BASE_URL']!;

    final result = await get(Uri.parse("$baseUrl/b/1IXK"));

    return GetAllMotelsModel.fromJson(result.body);
  }
}
