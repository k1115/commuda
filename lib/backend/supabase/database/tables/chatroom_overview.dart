import '../database.dart';

class ChatroomOverviewTable extends SupabaseTable<ChatroomOverviewRow> {
  @override
  String get tableName => 'chatroom_overview';

  @override
  ChatroomOverviewRow createRow(Map<String, dynamic> data) =>
      ChatroomOverviewRow(data);
}

class ChatroomOverviewRow extends SupabaseDataRow {
  ChatroomOverviewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatroomOverviewTable();

  int? get chatroomId => getField<int>('chatroom_id');
  set chatroomId(int? value) => setField<int>('chatroom_id', value);

  int? get creatorId => getField<int>('creator_id');
  set creatorId(int? value) => setField<int>('creator_id', value);

  int? get targetId => getField<int>('target_id');
  set targetId(int? value) => setField<int>('target_id', value);

  List<int> get userIds => getListField<int>('user_ids');
  set userIds(List<int>? value) => setListField<int>('user_ids', value);

  List<String> get nickNames => getListField<String>('nick_names');
  set nickNames(List<String>? value) =>
      setListField<String>('nick_names', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  DateTime? get lastMessageCreatedAt =>
      getField<DateTime>('last_message_created_at');
  set lastMessageCreatedAt(DateTime? value) =>
      setField<DateTime>('last_message_created_at', value);

  int? get creatorUnreadCount => getField<int>('creator_unread_count');
  set creatorUnreadCount(int? value) =>
      setField<int>('creator_unread_count', value);

  int? get targetUnreadCount => getField<int>('target_unread_count');
  set targetUnreadCount(int? value) =>
      setField<int>('target_unread_count', value);
}
