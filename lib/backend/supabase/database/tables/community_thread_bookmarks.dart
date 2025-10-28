import '../database.dart';

class CommunityThreadBookmarksTable
    extends SupabaseTable<CommunityThreadBookmarksRow> {
  @override
  String get tableName => 'community_thread_bookmarks';

  @override
  CommunityThreadBookmarksRow createRow(Map<String, dynamic> data) =>
      CommunityThreadBookmarksRow(data);
}

class CommunityThreadBookmarksRow extends SupabaseDataRow {
  CommunityThreadBookmarksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityThreadBookmarksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get threadId => getField<int>('thread_id')!;
  set threadId(int value) => setField<int>('thread_id', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);
}
