import 'package:mobile_store/src/core/model/review_dtos.dart';
import 'package:mobile_store/src/core/remote/response/review_response/review_response.dart';
import 'package:mobile_store/src/features/review/bloc_state/review_event.dart';
import 'package:rxdart/rxdart.dart';

import '../service/review_service.dart';
import 'get_review_state.dart';

class GetReviewBloc {
  ReviewService reviewService = ReviewService();
  final _stateController = BehaviorSubject<GetReviewState>();

  Stream<GetReviewState> get state => _stateController.stream;
  String? errors;
  List<ReviewDTOs>? reviewList = [];
  int totalItems = 0;

  Future<void> getReviewBloc(GetReviewEvent event) async {

    final getReviewResult = reviewService.getReviewService(
        event.manufacturerID, event.no, event.limit);

    ReviewResponse? reviewResponse = await getReviewResult;

    try {
      await getReviewResult.then((value) {
        totalItems = value.totalItems ?? 0;
      });
      reviewResponse = await getReviewResult;
    } catch (e) {
      errors = e.toString();
    }

    if (totalItems > 0) {
      _stateController.sink.add(SuccessGetReviewState(reviewResponse!));
    } else {
      _stateController.sink.add(ErrorGetReviewState(errors ?? ''));
    }
  }
}
