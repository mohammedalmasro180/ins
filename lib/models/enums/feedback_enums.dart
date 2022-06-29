import 'package:easy_localization/easy_localization.dart';

enum FeedbackType {error,warning,bugs}
enum FeedbackStatus {assigned,reviewing,done}
Map<FeedbackType, String> feedBackTypeValue = {
  FeedbackType.error:'error',
  FeedbackType.warning:'warning',
  FeedbackType.bugs:'bugs'
};

Map<FeedbackStatus, String> feedbackStatusValue = {
  FeedbackStatus.assigned:'assigned',
  FeedbackStatus.reviewing:'reviewing',
  FeedbackStatus.done:'done'
};