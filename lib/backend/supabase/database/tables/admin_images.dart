import '../database.dart';

class AdminImagesTable extends SupabaseTable<AdminImagesRow> {
  @override
  String get tableName => 'admin_images';

  @override
  AdminImagesRow createRow(Map<String, dynamic> data) => AdminImagesRow(data);
}

class AdminImagesRow extends SupabaseDataRow {
  AdminImagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdminImagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get adminId => getField<int>('admin_id')!;
  set adminId(int value) => setField<int>('admin_id', value);

  String get imageUrl => getField<String>('image_url')!;
  set imageUrl(String value) => setField<String>('image_url', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
