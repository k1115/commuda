import '../database.dart';

class UserAnnouncementsTable extends SupabaseTable<UserAnnouncementsRow> {
  @override
  String get tableName => 'user_announcements';

  @override
  UserAnnouncementsRow createRow(Map<String, dynamic> data) =>
      UserAnnouncementsRow(data);
}

class UserAnnouncementsRow extends SupabaseDataRow {
  UserAnnouncementsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserAnnouncementsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int get annoucementId => getField<int>('annoucement_id')!;
  set annoucementId(int value) => setField<int>('annoucement_id', value);

  bool get isRead => getField<bool>('is_read')!;
  set isRead(bool value) => setField<bool>('is_read', value);
}
