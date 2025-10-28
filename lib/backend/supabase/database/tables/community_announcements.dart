import '../database.dart';

class CommunityAnnouncementsTable
    extends SupabaseTable<CommunityAnnouncementsRow> {
  @override
  String get tableName => 'community_announcements';

  @override
  CommunityAnnouncementsRow createRow(Map<String, dynamic> data) =>
      CommunityAnnouncementsRow(data);
}

class CommunityAnnouncementsRow extends SupabaseDataRow {
  CommunityAnnouncementsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityAnnouncementsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get threadId => getField<int>('thread_id')!;
  set threadId(int value) => setField<int>('thread_id', value);

  int get type => getField<int>('type')!;
  set type(int value) => setField<int>('type', value);

  int? get commentId => getField<int>('comment_id');
  set commentId(int? value) => setField<int>('comment_id', value);

  int? get reactionType => getField<int>('reaction_type');
  set reactionType(int? value) => setField<int>('reaction_type', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int get creatorId => getField<int>('creator_id')!;
  set creatorId(int value) => setField<int>('creator_id', value);

  bool get isRead => getField<bool>('is_read')!;
  set isRead(bool value) => setField<bool>('is_read', value);

  String? get mention => getField<String>('mention');
  set mention(String? value) => setField<String>('mention', value);
}
