import '../database.dart';

class UserNotificationsTable extends SupabaseTable<UserNotificationsRow> {
  @override
  String get tableName => 'user_notifications';

  @override
  UserNotificationsRow createRow(Map<String, dynamic> data) =>
      UserNotificationsRow(data);
}

class UserNotificationsRow extends SupabaseDataRow {
  UserNotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserNotificationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  List<int> get notifications => getListField<int>('notifications');
  set notifications(List<int>? value) =>
      setListField<int>('notifications', value);
}
