import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/features/profile/domain/usecases/get_current_user.dart';
import 'package:furnika/features/profile/domain/usecases/update_current_user.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetCurrentUser getCurrentUser;
  final UpdateCurrentUser updateCurrentUser;

  ProfileCubit({
    required this.getCurrentUser,
    required this.updateCurrentUser,
  }) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    final result = await getCurrentUser.call();

    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (user) => emit(ProfileLoaded(user)),
    );
  }

  Future<void> updateProfile({
    required String username,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
  }) async {
    emit(ProfileLoading());
    final result = await updateCurrentUser.call(
      UpdateCurrentUserParams(
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        gender: gender,
        birthday: birthday,
      ),
    );

    result.fold(
      (failure) => emit(ProfileError(failure.message)),
      (user) {
        emit(const ProfileUpdated());
        return emit(ProfileLoaded(user));
      },
    );
  }
}
