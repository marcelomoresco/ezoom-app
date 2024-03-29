import 'package:ezoom_todolist/src/core/services/client/client_service.dart';
import 'package:ezoom_todolist/src/core/services/client/dio/custom_dio.dart';
import 'package:ezoom_todolist/src/core/services/client/dio/dio_client_service_impl.dart';
import 'package:ezoom_todolist/src/modules/tasks/tasks_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        TasksModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<ClientService>(
          (i) => DioClientService(
            dio: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/splash',
          child: (context, args) => const SizedBox(),
          transition: TransitionType.defaultTransition,
        ),
        ChildRoute(
          '/login',
          child: (context, args) => const SizedBox(),
          transition: TransitionType.rightToLeftWithFade,
          guards: [
            //LoginGuard(),
          ],
        ),
      ];
}
