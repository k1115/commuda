import '../database.dart';

class FriendRequestsTable extends SupabaseTable<FriendRequestsRow> {
  @override
  String get tableName => 'friend_requests';

  @override
  FriendRequestsRow createRow(Map<String, dynamic> data) =>
      FriendRequestsRow(data);
}

class FriendRequestsRow extends SupabaseDataRow {
  FriendRequestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FriendRequestsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int get targetId => getField<int>('target_id')!;
  set targetId(int value) => setField<int>('target_id', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool get isRead => getField<bool>('is_read')!;
  set isRead(bool value) => setField<bool>('is_read', value);

  int get communityId => getField<int>('community_id')!;
  set communityId(int value) => setField<int>('community_id', value);
}
