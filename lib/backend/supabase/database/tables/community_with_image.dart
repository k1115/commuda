import '../database.dart';

class CommunityWithImageTable extends SupabaseTable<CommunityWithImageRow> {
  @override
  String get tableName => 'community_with_image';

  @override
  CommunityWithImageRow createRow(Map<String, dynamic> data) =>
      CommunityWithImageRow(data);
}

class CommunityWithImageRow extends SupabaseDataRow {
  CommunityWithImageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommunityWithImageTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  int? get creatorId => getField<int>('creator_id');
  set creatorId(int? value) => setField<int>('creator_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get rules => getField<String>('rules');
  set rules(String? value) => setField<String>('rules', value);

  int? get privacyType => getField<int>('privacy_type');
  set privacyType(int? value) => setField<int>('privacy_type', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  int? get memberCount => getField<int>('member_count');
  set memberCount(int? value) => setField<int>('member_count', value);

  int? get activeMemberCount => getField<int>('active_member_count');
  set activeMemberCount(int? value) =>
      setField<int>('active_member_count', value);

  int? get reactionCount => getField<int>('reaction_count');
  set reactionCount(int? value) => setField<int>('reaction_count', value);

  int? get recentReactionCount => getField<int>('recent_reaction_count');
  set recentReactionCount(int? value) =>
      setField<int>('recent_reaction_count', value);

  int? get threadCount => getField<int>('thread_count');
  set threadCount(int? value) => setField<int>('thread_count', value);

  int? get recentThreadCount => getField<int>('recent_thread_count');
  set recentThreadCount(int? value) =>
      setField<int>('recent_thread_count', value);

  int? get commentCount => getField<int>('comment_count');
  set commentCount(int? value) => setField<int>('comment_count', value);

  int? get recentCommentCount => getField<int>('recent_comment_count');
  set recentCommentCount(int? value) =>
      setField<int>('recent_comment_count', value);

  double? get ranking => getField<double>('ranking');
  set ranking(double? value) => setField<double>('ranking', value);

  double? get currentRanking => getField<double>('current_ranking');
  set currentRanking(double? value) =>
      setField<double>('current_ranking', value);

  String? get inviteCode => getField<String>('invite_code');
  set inviteCode(String? value) => setField<String>('invite_code', value);

  List<String> get categories => getListField<String>('categories');
  set categories(List<String>? value) =>
      setListField<String>('categories', value);
}
