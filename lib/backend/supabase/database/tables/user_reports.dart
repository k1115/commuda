import '../database.dart';

class UserReportsTable extends SupabaseTable<UserReportsRow> {
  @override
  String get tableName => 'user_reports';

  @override
  UserReportsRow createRow(Map<String, dynamic> data) => UserReportsRow(data);
}

class UserReportsRow extends SupabaseDataRow {
  UserReportsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserReportsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get reportUserId => getField<int>('report_user_id')!;
  set reportUserId(int value) => setField<int>('report_user_id', value);

  int get reportedUserId => getField<int>('reported_user_id')!;
  set reportedUserId(int value) => setField<int>('reported_user_id', value);

  List<String> get reasons => getListField<String>('reasons');
  set reasons(List<String>? value) => setListField<String>('reasons', value);

  String get detail => getField<String>('detail')!;
  set detail(String value) => setField<String>('detail', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);
}
