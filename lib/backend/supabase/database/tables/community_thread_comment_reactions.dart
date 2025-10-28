import '../database.dart';

class CommunityThreadCommentReactionsTable
    extends SupabaseTable<CommunityThreadCommentReactionsRow> {
  @override
  String get tableName => 'community_thread_comment_reactions';

  @override
  CommunityThreadCommentReactionsRow createRow(Map<String, dynamic> data) =>
      CommunityThreadCommentReactionsRow(data);
}

class CommunityThreadCommentReactionsRow extends SupabaseDataRow {
  CommunityThreadCommentReactionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityThreadCommentReactionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int get commentId => getField<int>('comment_id')!;
  set commentId(int value) => setField<int>('comment_id', value);

  int get reactionType => getField<int>('reaction_type')!;
  set reactionType(int value) => setField<int>('reaction_type', value);
}
