import '../database.dart';

class CommunityThreadsTable extends SupabaseTable<CommunityThreadsRow> {
  @override
  String get tableName => 'community_threads';

  @override
  CommunityThreadsRow createRow(Map<String, dynamic> data) =>
      CommunityThreadsRow(data);
}

class CommunityThreadsRow extends SupabaseDataRow {
  CommunityThreadsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityThreadsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get communityId => getField<int>('community_id')!;
  set communityId(int value) => setField<int>('community_id', value);

  int get creatorId => getField<int>('creator_id')!;
  set creatorId(int value) => setField<int>('creator_id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  List<String> get imageUrl => getListField<String>('image_url');
  set imageUrl(List<String>? value) => setListField<String>('image_url', value);
}
