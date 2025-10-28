import '../database.dart';

class AnnouncementsDetailTable extends SupabaseTable<AnnouncementsDetailRow> {
  @override
  String get tableName => 'announcements_detail';

  @override
  AnnouncementsDetailRow createRow(Map<String, dynamic> data) =>
      AnnouncementsDetailRow(data);
}

class AnnouncementsDetailRow extends SupabaseDataRow {
  AnnouncementsDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnnouncementsDetailTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  DateTime? get scheduledAt => getField<DateTime>('scheduled_at');
  set scheduledAt(DateTime? value) => setField<DateTime>('scheduled_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);
}
