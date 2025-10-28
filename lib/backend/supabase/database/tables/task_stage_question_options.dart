import '../database.dart';

class TaskStageQuestionOptionsTable
    extends SupabaseTable<TaskStageQuestionOptionsRow> {
  @override
  String get tableName => 'task_stage_question_options';

  @override
  TaskStageQuestionOptionsRow createRow(Map<String, dynamic> data) =>
      TaskStageQuestionOptionsRow(data);
}

class TaskStageQuestionOptionsRow extends SupabaseDataRow {
  TaskStageQuestionOptionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TaskStageQuestionOptionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get questionId => getField<int>('question_id')!;
  set questionId(int value) => setField<int>('question_id', value);

  String get optionText => getField<String>('option_text')!;
  set optionText(String value) => setField<String>('option_text', value);

  int get displayOrder => getField<int>('display_order')!;
  set displayOrder(int value) => setField<int>('display_order', value);

  bool? get isCorrect => getField<bool>('is_correct');
  set isCorrect(bool? value) => setField<bool>('is_correct', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
