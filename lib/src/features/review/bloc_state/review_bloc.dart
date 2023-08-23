import 'package:mobile_store/src/features/review/bloc_state/review_event.dart';
import 'package:mobile_store/src/features/review/bloc_state/review_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../main.dart';
import '../../../core/model/review_dtos.dart';
import '../../../core/remote/response/review_response/review_response.dart';
import '../service/review_service.dart';

class GetReviewBloc {
  ReviewService reviewService = ReviewService();
  final _stateController = BehaviorSubject<GetReviewState>();

  Stream<GetReviewState> get state => _stateController.stream;
  String? errors;
  List<ReviewDTOs>? reviewList = [];
  int totalItems = 0;

  Future<void> getReviewBloc(GetReviewEvent event) async {
    final getReviewResult = reviewService.getReviewService(getUser.token ?? '',
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

class CreateReviewBloc {
  ReviewService reviewService = ReviewService();
  String? errors;
  int? httpCode;
  final _stateController = BehaviorSubject<CreateReviewState>();
  Stream<CreateReviewState> get state => _stateController.stream;

  Future<void> createReviewBloc(CreateReviewEvent event) async {
    final createReviewResult = reviewService.createReviewService(
        getUser.token ?? '',
        event.userName,
        event.productId,
        event.comment,
        event.rating,
        true);

    try{
      await createReviewResult.then((value) {
        httpCode = value.httpCode;
      });
    }catch(e){
      errors = e.toString();
    }

    if(httpCode != null){
      _stateController.sink.add(SuccessCreateReviewState());
    }else{
      _stateController.sink.add(ErrorCreateReviewState(errors ?? ''));
    }
  }
}

class EditReviewBloc {
  ReviewService reviewService = ReviewService();
  final _stateController = BehaviorSubject<EditReviewState>();

  Stream<EditReviewState> get state => _stateController.stream;
  String? errors;
  int? productID;
  String? comment;

  Future<void> editReviewBloc(EditReviewEvent event) async {
    final editReviewResult = reviewService.editReviewService(
      getUser.token ?? '',
      event.userName,
      event.productId,
      event.reviewId,
      event.comment,
      event.rating,
      true,
    );

    try {
      await editReviewResult.then((value) {
        comment = value.comment;
        productID = value.productID;
      });
    } catch (e) {
      errors = e.toString();
    }

    if (comment != null && productID != null) {
      _stateController.sink.add(SuccessEditReviewState());
    } else {
      _stateController.sink.add(ErrorEditReviewState(errors ?? ''));
    }
  }
}