import 'package:bloc/bloc.dart';
import 'package:ezoom_todolist/src/core/widgets/ezoom_toast.dart';
import 'package:ezoom_todolist/src/modules/auth/data/usecases/register_user_usecase.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/entities/user.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final RegisterUserUsecase registerUserUsecase;
  SignupCubit({
    required this.registerUserUsecase,
  }) : super(SignupInitial());

  void register(User user) async {
    try {
      emit(SignupLoading());
      await registerUserUsecase(user);
      emit(SignupSuccess());
    } catch (e) {
      EzoomToast.showErrorToast("Opss...algo occoreu!");
    }
  }
}
