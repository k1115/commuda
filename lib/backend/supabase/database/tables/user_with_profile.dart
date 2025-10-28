import '../database.dart';

class UserWithProfileTable extends SupabaseTable<UserWithProfileRow> {
  @override
  String get tableName => 'user_with_profile';

  @override
  UserWithProfileRow createRow(Map<String, dynamic> data) =>
      UserWithProfileRow(data);
}

class UserWithProfileRow extends SupabaseDataRow {
  UserWithProfileRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserWithProfileTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get authUserId => getField<String>('auth_user_id');
  set authUserId(String? value) => setField<String>('auth_user_id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  int? get role => getField<int>('role');
  set role(int? value) => setField<int>('role', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get nickName => getField<String>('nick_name');
  set nickName(String? value) => setField<String>('nick_name', value);

  DateTime? get lastLoginedAt => getField<DateTime>('last_logined_at');
  set lastLoginedAt(DateTime? value) =>
      setField<DateTime>('last_logined_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get realName => getField<String>('real_name');
  set realName(String? value) => setField<String>('real_name', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);

  String? get coverImage => getField<String>('cover_image');
  set coverImage(String? value) => setField<String>('cover_image', value);

  List<int> get profileBadges => getListField<int>('profile_badges');
  set profileBadges(List<int>? value) =>
      setListField<int>('profile_badges', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get iconBadge => getField<int>('icon_badge');
  set iconBadge(int? value) => setField<int>('icon_badge', value);

  String? get iconBadgeUrl => getField<String>('icon_badge_url');
  set iconBadgeUrl(String? value) => setField<String>('icon_badge_url', value);

  String? get provider => getField<String>('provider');
  set provider(String? value) => setField<String>('provider', value);
}
