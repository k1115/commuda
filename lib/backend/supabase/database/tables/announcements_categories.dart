import '../database.dart';

class AnnouncementsCategoriesTable
    extends SupabaseTable<AnnouncementsCategoriesRow> {
  @override
  String get tableName => 'announcements_categories';

  @override
  AnnouncementsCategoriesRow createRow(Map<String, dynamic> data) =>
      AnnouncementsCategoriesRow(data);
}

class AnnouncementsCategoriesRow extends SupabaseDataRow {
  AnnouncementsCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnnouncementsCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get categoryName => getField<String>('category_name')!;
  set categoryName(String value) => setField<String>('category_name', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
