import '../database.dart';

class CommunityBookmarksTable extends SupabaseTable<CommunityBookmarksRow> {
  @override
  String get tableName => 'community_bookmarks';

  @override
  CommunityBookmarksRow createRow(Map<String, dynamic> data) =>
      CommunityBookmarksRow(data);
}

class CommunityBookmarksRow extends SupabaseDataRow {
  CommunityBookmarksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityBookmarksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get communityId => getField<int>('community_id');
  set communityId(int? value) => setField<int>('community_id', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
