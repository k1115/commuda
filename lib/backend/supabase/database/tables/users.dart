import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get authUserId => getField<String>('auth_user_id')!;
  set authUserId(String value) => setField<String>('auth_user_id', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  int get role => getField<int>('role')!;
  set role(int value) => setField<int>('role', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  String get nickName => getField<String>('nick_name')!;
  set nickName(String value) => setField<String>('nick_name', value);

  DateTime get lastLoginedAt => getField<DateTime>('last_logined_at')!;
  set lastLoginedAt(DateTime value) =>
      setField<DateTime>('last_logined_at', value);

  String? get realName => getField<String>('real_name');
  set realName(String? value) => setField<String>('real_name', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);
}
