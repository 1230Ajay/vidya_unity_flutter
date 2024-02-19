import 'package:vidya_unity/common/entities/entities.dart';

abstract class ProfileEvents{
  const ProfileEvents();
}

class TriggerProfile extends ProfileEvents{
  final UserItem profile;
  TriggerProfile({required this.profile});
}