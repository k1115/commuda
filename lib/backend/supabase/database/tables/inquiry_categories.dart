import '../database.dart';

class InquiryCategoriesTable extends SupabaseTable<InquiryCategoriesRow> {
  @override
  String get tableName => 'inquiry_categories';

  @override
  InquiryCategoriesRow createRow(Map<String, dynamic> data) =>
      InquiryCategoriesRow(data);
}

class InquiryCategoriesRow extends SupabaseDataRow {
  InquiryCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InquiryCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get category => getField<String>('category')!;
  set category(String value) => setField<String>('category', value);
}
