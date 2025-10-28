import '../database.dart';

class UserActivityDateTable extends SupabaseTable<UserActivityDateRow> {
  @override
  String get tableName => 'user_activity_date';

  @override
  UserActivityDateRow createRow(Map<String, dynamic> data) =>
      UserActivityDateRow(data);
}

class UserActivityDateRow extends SupabaseDataRow {
  UserActivityDateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserActivityDateTable();

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  DateTime? get continueDayDate => getField<DateTime>('continue_day_date');
  set continueDayDate(DateTime? value) =>
      setField<DateTime>('continue_day_date', value);

  DateTime? get totalDayDate => getField<DateTime>('total_day_date');
  set totalDayDate(DateTime? value) =>
      setField<DateTime>('total_day_date', value);

  DateTime? get threadDate => getField<DateTime>('thread_date');
  set threadDate(DateTime? value) => setField<DateTime>('thread_date', value);

  DateTime? get commentDate => getField<DateTime>('comment_date');
  set commentDate(DateTime? value) => setField<DateTime>('comment_date', value);

  DateTime? get commentReceiveDate =>
      getField<DateTime>('comment_receive_date');
  set commentReceiveDate(DateTime? value) =>
      setField<DateTime>('comment_receive_date', value);

  DateTime? get commentReactionDate =>
      getField<DateTime>('comment_reaction_date');
  set commentReactionDate(DateTime? value) =>
      setField<DateTime>('comment_reaction_date', value);

  DateTime? get reactionReceiveDate =>
      getField<DateTime>('reaction_receive_date');
  set reactionReceiveDate(DateTime? value) =>
      setField<DateTime>('reaction_receive_date', value);

  DateTime? get friendDate => getField<DateTime>('friend_date');
  set friendDate(DateTime? value) => setField<DateTime>('friend_date', value);

  DateTime? get footprintAsUserDate =>
      getField<DateTime>('footprint_as_user_date');
  set footprintAsUserDate(DateTime? value) =>
      setField<DateTime>('footprint_as_user_date', value);

  DateTime? get footprintAsTargetDate =>
      getField<DateTime>('footprint_as_target_date');
  set footprintAsTargetDate(DateTime? value) =>
      setField<DateTime>('footprint_as_target_date', value);

  DateTime? get communityDate => getField<DateTime>('community_date');
  set communityDate(DateTime? value) =>
      setField<DateTime>('community_date', value);

  DateTime? get communityOver100Date =>
      getField<DateTime>('community_over_100_date');
  set communityOver100Date(DateTime? value) =>
      setField<DateTime>('community_over_100_date', value);
}
