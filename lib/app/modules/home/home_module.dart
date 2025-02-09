import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_gdm/app/modules/home/home.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomeView()),
      ];
}
