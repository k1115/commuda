import '../database.dart';

class CommunityThreadDetailsTable
    extends SupabaseTable<CommunityThreadDetailsRow> {
  @override
  String get tableName => 'community_thread_details';

  @override
  CommunityThreadDetailsRow createRow(Map<String, dynamic> data) =>
      CommunityThreadDetailsRow(data);
}

class CommunityThreadDetailsRow extends SupabaseDataRow {
  CommunityThreadDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityThreadDetailsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  int? get communityId => getField<int>('community_id');
  set communityId(int? value) => setField<int>('community_id', value);

  int? get creatorId => getField<int>('creator_id');
  set creatorId(int? value) => setField<int>('creator_id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  List<String> get imageUrl => getListField<String>('image_url');
  set imageUrl(List<String>? value) => setListField<String>('image_url', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);

  int? get iconBadge => getField<int>('icon_badge');
  set iconBadge(int? value) => setField<int>('icon_badge', value);

  String? get iconBadgeUrl => getField<String>('icon_badge_url');
  set iconBadgeUrl(String? value) => setField<String>('icon_badge_url', value);

  String? get nickName => getField<String>('nick_name');
  set nickName(String? value) => setField<String>('nick_name', value);

  String? get communityName => getField<String>('community_name');
  set communityName(String? value) => setField<String>('community_name', value);

  int? get privacyType => getField<int>('privacy_type');
  set privacyType(int? value) => setField<int>('privacy_type', value);

  String? get communityCoverImage => getField<String>('community_cover_image');
  set communityCoverImage(String? value) =>
      setField<String>('community_cover_image', value);

  int? get commentCount => getField<int>('comment_count');
  set commentCount(int? value) => setField<int>('comment_count', value);

  int? get reaction0 => getField<int>('reaction_0');
  set reaction0(int? value) => setField<int>('reaction_0', value);

  int? get reaction1 => getField<int>('reaction_1');
  set reaction1(int? value) => setField<int>('reaction_1', value);

  int? get reaction2 => getField<int>('reaction_2');
  set reaction2(int? value) => setField<int>('reaction_2', value);

  int? get reaction3 => getField<int>('reaction_3');
  set reaction3(int? value) => setField<int>('reaction_3', value);
}
