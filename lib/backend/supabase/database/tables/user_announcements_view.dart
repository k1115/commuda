import '../database.dart';

class UserAnnouncementsViewTable
    extends SupabaseTable<UserAnnouncementsViewRow> {
  @override
  String get tableName => 'user_announcements_view';

  @override
  UserAnnouncementsViewRow createRow(Map<String, dynamic> data) =>
      UserAnnouncementsViewRow(data);
}

class UserAnnouncementsViewRow extends SupabaseDataRow {
  UserAnnouncementsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserAnnouncementsViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get annoucementId => getField<int>('annoucement_id');
  set annoucementId(int? value) => setField<int>('annoucement_id', value);

  bool? get isRead => getField<bool>('is_read');
  set isRead(bool? value) => setField<bool>('is_read', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  DateTime? get scheduledAt => getField<DateTime>('scheduled_at');
  set scheduledAt(DateTime? value) => setField<DateTime>('scheduled_at', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);
}
