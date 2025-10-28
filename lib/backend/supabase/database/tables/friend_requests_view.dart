import '../database.dart';

class FriendRequestsViewTable extends SupabaseTable<FriendRequestsViewRow> {
  @override
  String get tableName => 'friend_requests_view';

  @override
  FriendRequestsViewRow createRow(Map<String, dynamic> data) =>
      FriendRequestsViewRow(data);
}

class FriendRequestsViewRow extends SupabaseDataRow {
  FriendRequestsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FriendRequestsViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  int? get targetId => getField<int>('target_id');
  set targetId(int? value) => setField<int>('target_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  bool? get isRead => getField<bool>('is_read');
  set isRead(bool? value) => setField<bool>('is_read', value);

  int? get communityId => getField<int>('community_id');
  set communityId(int? value) => setField<int>('community_id', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);

  String? get nickName => getField<String>('nick_name');
  set nickName(String? value) => setField<String>('nick_name', value);

  String? get communityName => getField<String>('community_name');
  set communityName(String? value) => setField<String>('community_name', value);
}
