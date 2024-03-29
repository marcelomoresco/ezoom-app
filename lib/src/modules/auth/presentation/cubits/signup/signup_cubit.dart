import 'package:bloc/bloc.dart';
import 'package:ezoom_todolist/src/modules/auth/data/usecases/register_user_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final RegisterUserUsecase registerUserUsecase;
  SignupCubit({
    required this.registerUserUsecase,
  }) : super(SignupInitial());
}
