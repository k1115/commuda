import '../database.dart';

class CommunityThreadCommentsTable
    extends SupabaseTable<CommunityThreadCommentsRow> {
  @override
  String get tableName => 'community_thread_comments';

  @override
  CommunityThreadCommentsRow createRow(Map<String, dynamic> data) =>
      CommunityThreadCommentsRow(data);
}

class CommunityThreadCommentsRow extends SupabaseDataRow {
  CommunityThreadCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityThreadCommentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get threadId => getField<int>('thread_id')!;
  set threadId(int value) => setField<int>('thread_id', value);

  int get creatorId => getField<int>('creator_id')!;
  set creatorId(int value) => setField<int>('creator_id', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  int? get parentId => getField<int>('parent_id');
  set parentId(int? value) => setField<int>('parent_id', value);

  int get communityId => getField<int>('community_id')!;
  set communityId(int value) => setField<int>('community_id', value);

  List<String> get image => getListField<String>('image');
  set image(List<String>? value) => setListField<String>('image', value);
}
