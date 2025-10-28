import '../database.dart';

class TaskStagesTable extends SupabaseTable<TaskStagesRow> {
  @override
  String get tableName => 'task_stages';

  @override
  TaskStagesRow createRow(Map<String, dynamic> data) => TaskStagesRow(data);
}

class TaskStagesRow extends SupabaseDataRow {
  TaskStagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TaskStagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get taskId => getField<int>('task_id')!;
  set taskId(int value) => setField<int>('task_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  int? get descExtraType => getField<int>('desc_extra_type');
  set descExtraType(int? value) => setField<int>('desc_extra_type', value);

  String? get descExtraContent => getField<String>('desc_extra_content');
  set descExtraContent(String? value) =>
      setField<String>('desc_extra_content', value);

  int get pointType => getField<int>('point_type')!;
  set pointType(int value) => setField<int>('point_type', value);

  int get pointValue => getField<int>('point_value')!;
  set pointValue(int value) => setField<int>('point_value', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
