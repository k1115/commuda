import '../database.dart';

class UserLoginsTable extends SupabaseTable<UserLoginsRow> {
  @override
  String get tableName => 'user_logins';

  @override
  UserLoginsRow createRow(Map<String, dynamic> data) => UserLoginsRow(data);
}

class UserLoginsRow extends SupabaseDataRow {
  UserLoginsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserLoginsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  String get loginDate => getField<String>('login_date')!;
  set loginDate(String value) => setField<String>('login_date', value);
}
