import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_gdm/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];

  @override
  List<Module> get imports => [];
}
