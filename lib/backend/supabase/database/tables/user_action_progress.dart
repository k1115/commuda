import '../database.dart';

class UserActionProgressTable extends SupabaseTable<UserActionProgressRow> {
  @override
  String get tableName => 'user_action_progress';

  @override
  UserActionProgressRow createRow(Map<String, dynamic> data) =>
      UserActionProgressRow(data);
}

class UserActionProgressRow extends SupabaseDataRow {
  UserActionProgressRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserActionProgressTable();

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get actionId => getField<int>('action_id');
  set actionId(int? value) => setField<int>('action_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  int? get count => getField<int>('count');
  set count(int? value) => setField<int>('count', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  int? get level => getField<int>('level');
  set level(int? value) => setField<int>('level', value);

  bool? get isComplete => getField<bool>('is_complete');
  set isComplete(bool? value) => setField<bool>('is_complete', value);

  bool? get isDisplay => getField<bool>('is_display');
  set isDisplay(bool? value) => setField<bool>('is_display', value);
}
