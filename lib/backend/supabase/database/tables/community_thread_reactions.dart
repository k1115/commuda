import '../database.dart';

class CommunityThreadReactionsTable
    extends SupabaseTable<CommunityThreadReactionsRow> {
  @override
  String get tableName => 'community_thread_reactions';

  @override
  CommunityThreadReactionsRow createRow(Map<String, dynamic> data) =>
      CommunityThreadReactionsRow(data);
}

class CommunityThreadReactionsRow extends SupabaseDataRow {
  CommunityThreadReactionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityThreadReactionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get threadId => getField<int>('thread_id')!;
  set threadId(int value) => setField<int>('thread_id', value);

  int get reactionType => getField<int>('reaction_type')!;
  set reactionType(int value) => setField<int>('reaction_type', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int get communityId => getField<int>('community_id')!;
  set communityId(int value) => setField<int>('community_id', value);
}
