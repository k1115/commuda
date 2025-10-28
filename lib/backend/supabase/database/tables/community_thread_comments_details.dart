import '../database.dart';

class CommunityThreadCommentsDetailsTable
    extends SupabaseTable<CommunityThreadCommentsDetailsRow> {
  @override
  String get tableName => 'community_thread_comments_details';

  @override
  CommunityThreadCommentsDetailsRow createRow(Map<String, dynamic> data) =>
      CommunityThreadCommentsDetailsRow(data);
}

class CommunityThreadCommentsDetailsRow extends SupabaseDataRow {
  CommunityThreadCommentsDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityThreadCommentsDetailsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  int? get threadId => getField<int>('thread_id');
  set threadId(int? value) => setField<int>('thread_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get creatorId => getField<int>('creator_id');
  set creatorId(int? value) => setField<int>('creator_id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get communityId => getField<int>('community_id');
  set communityId(int? value) => setField<int>('community_id', value);

  List<String> get image => getListField<String>('image');
  set image(List<String>? value) => setListField<String>('image', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);

  String? get nickName => getField<String>('nick_name');
  set nickName(String? value) => setField<String>('nick_name', value);

  int? get reaction0 => getField<int>('reaction_0');
  set reaction0(int? value) => setField<int>('reaction_0', value);

  int? get reaction1 => getField<int>('reaction_1');
  set reaction1(int? value) => setField<int>('reaction_1', value);

  int? get reaction2 => getField<int>('reaction_2');
  set reaction2(int? value) => setField<int>('reaction_2', value);

  int? get reaction3 => getField<int>('reaction_3');
  set reaction3(int? value) => setField<int>('reaction_3', value);

  int? get iconBadge => getField<int>('icon_badge');
  set iconBadge(int? value) => setField<int>('icon_badge', value);

  String? get iconBadgeUrl => getField<String>('icon_badge_url');
  set iconBadgeUrl(String? value) => setField<String>('icon_badge_url', value);
}
