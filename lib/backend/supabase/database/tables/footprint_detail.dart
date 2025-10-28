import '../database.dart';

class FootprintDetailTable extends SupabaseTable<FootprintDetailRow> {
  @override
  String get tableName => 'footprint_detail';

  @override
  FootprintDetailRow createRow(Map<String, dynamic> data) =>
      FootprintDetailRow(data);
}

class FootprintDetailRow extends SupabaseDataRow {
  FootprintDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FootprintDetailTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get targetId => getField<int>('target_id');
  set targetId(int? value) => setField<int>('target_id', value);

  int? get communityId => getField<int>('community_id');
  set communityId(int? value) => setField<int>('community_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get userProfileImage => getField<String>('user_profile_image');
  set userProfileImage(String? value) =>
      setField<String>('user_profile_image', value);

  String? get targetProfileImage => getField<String>('target_profile_image');
  set targetProfileImage(String? value) =>
      setField<String>('target_profile_image', value);

  String? get userNickName => getField<String>('user_nick_name');
  set userNickName(String? value) => setField<String>('user_nick_name', value);

  String? get targetNickName => getField<String>('target_nick_name');
  set targetNickName(String? value) =>
      setField<String>('target_nick_name', value);
}
