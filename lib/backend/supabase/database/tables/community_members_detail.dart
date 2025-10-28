import '../database.dart';

class CommunityMembersDetailTable
    extends SupabaseTable<CommunityMembersDetailRow> {
  @override
  String get tableName => 'community_members_detail';

  @override
  CommunityMembersDetailRow createRow(Map<String, dynamic> data) =>
      CommunityMembersDetailRow(data);
}

class CommunityMembersDetailRow extends SupabaseDataRow {
  CommunityMembersDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityMembersDetailTable();

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get communityId => getField<int>('community_id');
  set communityId(int? value) => setField<int>('community_id', value);

  int? get participateStatus => getField<int>('participate_status');
  set participateStatus(int? value) =>
      setField<int>('participate_status', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);

  String? get nickName => getField<String>('nick_name');
  set nickName(String? value) => setField<String>('nick_name', value);

  bool? get isCommunityOwner => getField<bool>('is_community_owner');
  set isCommunityOwner(bool? value) =>
      setField<bool>('is_community_owner', value);

  bool? get isActiveUser => getField<bool>('is_active_user');
  set isActiveUser(bool? value) => setField<bool>('is_active_user', value);

  bool? get isRead => getField<bool>('is_read');
  set isRead(bool? value) => setField<bool>('is_read', value);

  String? get communityName => getField<String>('community_name');
  set communityName(String? value) => setField<String>('community_name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get participateMessage => getField<String>('participate_message');
  set participateMessage(String? value) =>
      setField<String>('participate_message', value);

  int? get iconBadge => getField<int>('icon_badge');
  set iconBadge(int? value) => setField<int>('icon_badge', value);

  String? get iconBadgeUrl => getField<String>('icon_badge_url');
  set iconBadgeUrl(String? value) => setField<String>('icon_badge_url', value);
}
