import '../database.dart';

class TaskCoverImagesTable extends SupabaseTable<TaskCoverImagesRow> {
  @override
  String get tableName => 'task_cover_images';

  @override
  TaskCoverImagesRow createRow(Map<String, dynamic> data) =>
      TaskCoverImagesRow(data);
}

class TaskCoverImagesRow extends SupabaseDataRow {
  TaskCoverImagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TaskCoverImagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get taskId => getField<int>('task_id')!;
  set taskId(int value) => setField<int>('task_id', value);

  String get imageUrl => getField<String>('image_url')!;
  set imageUrl(String value) => setField<String>('image_url', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
