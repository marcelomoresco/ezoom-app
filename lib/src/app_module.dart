import 'package:ezoom_todolist/src/core/services/client/client_service.dart';
import 'package:ezoom_todolist/src/core/services/client/dio/custom_dio.dart';
import 'package:ezoom_todolist/src/core/services/client/dio/dio_client_service_impl.dart';
import 'package:ezoom_todolist/src/modules/auth/data/repository/user_repository_impl.dart';
import 'package:ezoom_todolist/src/modules/auth/data/usecases/auth_usecase.dart';
import 'package:ezoom_todolist/src/modules/auth/data/usecases/register_user_usecase.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/repositories/user_repository.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/cubits/login/login_cubit.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/page/login_page.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/page/register_page.dart';
import 'package:ezoom_todolist/src/modules/splash/splash_page.dart';
import 'package:ezoom_todolist/src/modules/tasks/tasks_module.dart';
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
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(
            clientService: i.get(),
          ),
        ),
        Bind.lazySingleton<LoginCubit>(
          (i) => LoginCubit(
            authUsecase: AuthUsecase(
              userRepository: i.get(),
            ),
          ),
        ),
        Bind.lazySingleton<SignupCubit>(
          (i) => SignupCubit(
            registerUserUsecase: RegisterUserUsecase(
              userRepository: i.get(),
            ),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/splash',
          child: (context, args) => const SplashPage(),
          transition: TransitionType.defaultTransition,
        ),
        ChildRoute(
          '/login',
          child: (context, args) => const LoginPage(),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ChildRoute(
          '/register',
          child: (context, args) => const RegisterPage(),
          transition: TransitionType.rightToLeftWithFade,
        ),
      ];
}
