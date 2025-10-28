import '../database.dart';

class FriendsProfileViewTable extends SupabaseTable<FriendsProfileViewRow> {
  @override
  String get tableName => 'friends_profile_view';

  @override
  FriendsProfileViewRow createRow(Map<String, dynamic> data) =>
      FriendsProfileViewRow(data);
}

class FriendsProfileViewRow extends SupabaseDataRow {
  FriendsProfileViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FriendsProfileViewTable();

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get friendId => getField<int>('friend_id');
  set friendId(int? value) => setField<int>('friend_id', value);

  String? get friendProfileImage => getField<String>('friend_profile_image');
  set friendProfileImage(String? value) =>
      setField<String>('friend_profile_image', value);

  String? get friendNickName => getField<String>('friend_nick_name');
  set friendNickName(String? value) =>
      setField<String>('friend_nick_name', value);

  int? get friendBadgeId => getField<int>('friend_badge_id');
  set friendBadgeId(int? value) => setField<int>('friend_badge_id', value);

  String? get friendBadgeIconUrl => getField<String>('friend_badge_icon_url');
  set friendBadgeIconUrl(String? value) =>
      setField<String>('friend_badge_icon_url', value);
}
