import '../database.dart';

class ProfileTable extends SupabaseTable<ProfileRow> {
  @override
  String get tableName => 'profile';

  @override
  ProfileRow createRow(Map<String, dynamic> data) => ProfileRow(data);
}

class ProfileRow extends SupabaseDataRow {
  ProfileRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfileTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

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

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);
}
