import '../database.dart';

class AdminsTable extends SupabaseTable<AdminsRow> {
  @override
  String get tableName => 'admins';

  @override
  AdminsRow createRow(Map<String, dynamic> data) => AdminsRow(data);
}

class AdminsRow extends SupabaseDataRow {
  AdminsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdminsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get authUserId => getField<String>('auth_user_id')!;
  set authUserId(String value) => setField<String>('auth_user_id', value);

  String get adminName => getField<String>('admin_name')!;
  set adminName(String value) => setField<String>('admin_name', value);

  int get adminRole => getField<int>('admin_role')!;
  set adminRole(int value) => setField<int>('admin_role', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  DateTime? get lastLoginAt => getField<DateTime>('last_login_at');
  set lastLoginAt(DateTime? value) =>
      setField<DateTime>('last_login_at', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
