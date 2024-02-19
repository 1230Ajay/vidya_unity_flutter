import 'package:vidya_unity/common/entities/entities.dart';

class ProfileState{
  final UserItem? profile;
  const ProfileState({this.profile});

  ProfileState copyWith({UserItem? profile}){
    return ProfileState(profile: profile??this.profile);
  }
}