import '../database.dart';

class CommunityMembersTable extends SupabaseTable<CommunityMembersRow> {
  @override
  String get tableName => 'community_members';

  @override
  CommunityMembersRow createRow(Map<String, dynamic> data) =>
      CommunityMembersRow(data);
}

class CommunityMembersRow extends SupabaseDataRow {
  CommunityMembersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityMembersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get communityId => getField<int>('community_id')!;
  set communityId(int value) => setField<int>('community_id', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get participateStatus => getField<int>('participate_status');
  set participateStatus(int? value) =>
      setField<int>('participate_status', value);

  String? get participateMessage => getField<String>('participate_message');
  set participateMessage(String? value) =>
      setField<String>('participate_message', value);

  bool get isRead => getField<bool>('is_read')!;
  set isRead(bool value) => setField<bool>('is_read', value);
}
