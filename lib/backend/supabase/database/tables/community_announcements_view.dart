import '../database.dart';

class CommunityAnnouncementsViewTable
    extends SupabaseTable<CommunityAnnouncementsViewRow> {
  @override
  String get tableName => 'community_announcements_view';

  @override
  CommunityAnnouncementsViewRow createRow(Map<String, dynamic> data) =>
      CommunityAnnouncementsViewRow(data);
}

class CommunityAnnouncementsViewRow extends SupabaseDataRow {
  CommunityAnnouncementsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityAnnouncementsViewTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get type => getField<int>('type');
  set type(int? value) => setField<int>('type', value);

  int? get reactionType => getField<int>('reaction_type');
  set reactionType(int? value) => setField<int>('reaction_type', value);

  int? get commentId => getField<int>('comment_id');
  set commentId(int? value) => setField<int>('comment_id', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get creatorId => getField<int>('creator_id');
  set creatorId(int? value) => setField<int>('creator_id', value);

  int? get threadId => getField<int>('thread_id');
  set threadId(int? value) => setField<int>('thread_id', value);

  bool? get isRead => getField<bool>('is_read');
  set isRead(bool? value) => setField<bool>('is_read', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get communityName => getField<String>('community_name');
  set communityName(String? value) => setField<String>('community_name', value);

  String? get commentContent => getField<String>('comment_content');
  set commentContent(String? value) =>
      setField<String>('comment_content', value);

  String? get threadContent => getField<String>('thread_content');
  set threadContent(String? value) => setField<String>('thread_content', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);
}
