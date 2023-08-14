import 'package:mobile_store/src/features/review/bloc_state/review_event.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';
import '../service/review_service.dart';
import 'edit_review_state.dart';

class EditReviewBloc {
  ReviewService reviewService = ReviewService();
  final _stateController = BehaviorSubject<EditReviewState>();

  Stream<EditReviewState> get state => _stateController.stream;
  String? errors;
  int? userID;
  int? productID;

  Future<void> editReviewBloc(EditReviewEvent event) async {
    final editReviewResult = reviewService.editReviewService(event.reviewID,
        getUser.token ?? '', event.comment, event.rating, true);

    try {
      await editReviewResult.then((value) {
        userID = value.userID;
        productID = value.productID;
      });
    } catch (e) {
      errors = e.toString();
    }

    if (userID != null && productID != null) {
      _stateController.sink.add(SuccessEditReviewState());
    } else {
      _stateController.sink.add(ErrorEditReviewState(errors ?? ''));
    }
  }
}
