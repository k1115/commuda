import '../database.dart';

class TaskStageQuestionsTable extends SupabaseTable<TaskStageQuestionsRow> {
  @override
  String get tableName => 'task_stage_questions';

  @override
  TaskStageQuestionsRow createRow(Map<String, dynamic> data) =>
      TaskStageQuestionsRow(data);
}

class TaskStageQuestionsRow extends SupabaseDataRow {
  TaskStageQuestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TaskStageQuestionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get stageId => getField<int>('stage_id')!;
  set stageId(int value) => setField<int>('stage_id', value);

  String get question => getField<String>('question')!;
  set question(String value) => setField<String>('question', value);

  int get answerType => getField<int>('answer_type')!;
  set answerType(int value) => setField<int>('answer_type', value);

  int get order => getField<int>('order')!;
  set order(int value) => setField<int>('order', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
