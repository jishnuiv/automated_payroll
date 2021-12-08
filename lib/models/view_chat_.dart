// class View_chat_ {
//   View_chat_({
//       this.result,});
//
//   View_chat_.fromJson(dynamic json) {
//     if (json['result'] != null) {
//       result = [];
//       json['result'].forEach((v) {
//         result?.add(Result.fromJson(v));
//       });
//     }
//   }
//   List<Result> result;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (result != null) {
//       map['result'] = result?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class Result {
//   Result({
//       this.chatId,
//       this.date,
//       this.personName,
//       this.message,});
//
//   Result.fromJson(dynamic json) {
//     chatId = json['chat_id'];
//     date = json['date'];
//     personName = json['person_name'];
//     message = json['message'];
//   }
//   String chatId;
//   String date;
//   String personName;
//   String message;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['chat_id'] = chatId;
//     map['date'] = date;
//     map['person_name'] = personName;
//     map['message'] = message;
//     return map;
//   }
//
// }