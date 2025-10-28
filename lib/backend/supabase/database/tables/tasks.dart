import '../database.dart';

class TasksTable extends SupabaseTable<TasksRow> {
  @override
  String get tableName => 'tasks';

  @override
  TasksRow createRow(Map<String, dynamic> data) => TasksRow(data);
}

class TasksRow extends SupabaseDataRow {
  TasksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TasksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get communityId => getField<int>('community_id')!;
  set communityId(int value) => setField<int>('community_id', value);

  int get creatorId => getField<int>('creator_id')!;
  set creatorId(int value) => setField<int>('creator_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  int? get descExtraType => getField<int>('desc_extra_type');
  set descExtraType(int? value) => setField<int>('desc_extra_type', value);

  String? get descExtraContent => getField<String>('desc_extra_content');
  set descExtraContent(String? value) =>
      setField<String>('desc_extra_content', value);

  DateTime get startDate => getField<DateTime>('start_date')!;
  set startDate(DateTime value) => setField<DateTime>('start_date', value);

  DateTime get endDate => getField<DateTime>('end_date')!;
  set endDate(DateTime value) => setField<DateTime>('end_date', value);

  int? get privacyType => getField<int>('privacy_type');
  set privacyType(int? value) => setField<int>('privacy_type', value);

  PostgresTime? get scheduledAt => getField<PostgresTime>('scheduled_at');
  set scheduledAt(PostgresTime? value) =>
      setField<PostgresTime>('scheduled_at', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
