import '../database.dart';

class UserActivitySummaryTable extends SupabaseTable<UserActivitySummaryRow> {
  @override
  String get tableName => 'user_activity_summary';

  @override
  UserActivitySummaryRow createRow(Map<String, dynamic> data) =>
      UserActivitySummaryRow(data);
}

class UserActivitySummaryRow extends SupabaseDataRow {
  UserActivitySummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserActivitySummaryTable();

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get continueDayCount => getField<int>('continue_day_count');
  set continueDayCount(int? value) =>
      setField<int>('continue_day_count', value);

  int? get totalDayCount => getField<int>('total_day_count');
  set totalDayCount(int? value) => setField<int>('total_day_count', value);

  int? get threadCount => getField<int>('thread_count');
  set threadCount(int? value) => setField<int>('thread_count', value);

  int? get commentCount => getField<int>('comment_count');
  set commentCount(int? value) => setField<int>('comment_count', value);

  int? get commentReceiveCount => getField<int>('comment_receive_count');
  set commentReceiveCount(int? value) =>
      setField<int>('comment_receive_count', value);

  int? get commentReactionCount => getField<int>('comment_reaction_count');
  set commentReactionCount(int? value) =>
      setField<int>('comment_reaction_count', value);

  int? get reactionReceiveCount => getField<int>('reaction_receive_count');
  set reactionReceiveCount(int? value) =>
      setField<int>('reaction_receive_count', value);

  int? get friendCount => getField<int>('friend_count');
  set friendCount(int? value) => setField<int>('friend_count', value);

  int? get footprintAsUserCount => getField<int>('footprint_as_user_count');
  set footprintAsUserCount(int? value) =>
      setField<int>('footprint_as_user_count', value);

  int? get footprintAsTargetCount => getField<int>('footprint_as_target_count');
  set footprintAsTargetCount(int? value) =>
      setField<int>('footprint_as_target_count', value);

  int? get communityCount => getField<int>('community_count');
  set communityCount(int? value) => setField<int>('community_count', value);

  int? get communityOver100Count => getField<int>('community_over_100_count');
  set communityOver100Count(int? value) =>
      setField<int>('community_over_100_count', value);
}
