import '../database.dart';

class AnnouncementsTable extends SupabaseTable<AnnouncementsRow> {
  @override
  String get tableName => 'announcements';

  @override
  AnnouncementsRow createRow(Map<String, dynamic> data) =>
      AnnouncementsRow(data);
}

class AnnouncementsRow extends SupabaseDataRow {
  AnnouncementsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnnouncementsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get categoryId => getField<int>('category_id')!;
  set categoryId(int value) => setField<int>('category_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  DateTime? get scheduledAt => getField<DateTime>('scheduled_at');
  set scheduledAt(DateTime? value) => setField<DateTime>('scheduled_at', value);

  List<int> get readUsers => getListField<int>('read_users');
  set readUsers(List<int>? value) => setListField<int>('read_users', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  int? get communityId => getField<int>('community_id');
  set communityId(int? value) => setField<int>('community_id', value);
}
