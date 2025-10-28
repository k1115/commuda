import '../database.dart';

class ProfileWithDetailTable extends SupabaseTable<ProfileWithDetailRow> {
  @override
  String get tableName => 'profile_with_detail';

  @override
  ProfileWithDetailRow createRow(Map<String, dynamic> data) =>
      ProfileWithDetailRow(data);
}

class ProfileWithDetailRow extends SupabaseDataRow {
  ProfileWithDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfileWithDetailTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get coverImage => getField<String>('cover_image');
  set coverImage(String? value) => setField<String>('cover_image', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);

  int? get iconBadge => getField<int>('icon_badge');
  set iconBadge(int? value) => setField<int>('icon_badge', value);

  List<int> get profileBadges => getListField<int>('profile_badges');
  set profileBadges(List<int>? value) =>
      setListField<int>('profile_badges', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get friendCount => getField<int>('friend_count');
  set friendCount(int? value) => setField<int>('friend_count', value);

  int? get badgeCount => getField<int>('badge_count');
  set badgeCount(int? value) => setField<int>('badge_count', value);

  String? get iconBadgeUrl => getField<String>('icon_badge_url');
  set iconBadgeUrl(String? value) => setField<String>('icon_badge_url', value);
}
