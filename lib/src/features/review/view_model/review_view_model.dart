import 'package:mobile_store/src/core/remote/response/review_response/review_response.dart';
import 'package:mobile_store/src/features/review/bloc_state/review_event.dart';

import '../../../../main.dart';
import '../bloc_state/review_bloc.dart';
import '../bloc_state/review_state.dart';

class ReviewViewModel {
  final CreateReviewBloc _createReviewBloc = CreateReviewBloc();
  final GetReviewBloc _getReviewBloc = GetReviewBloc();
  final EditReviewBloc _editReviewBloc = EditReviewBloc();

  Future<bool> createReviewViewModel(
      int productId, String comment, int rating) async {
    bool isSuccess = false;
    await _createReviewBloc.createReviewBloc(CreateReviewEvent(
        getUser.token ?? '',
        getUser.userDTO.fullName ?? '',
        productId,
        comment,
        rating,
        true));

    await _createReviewBloc.state.listen((state) {
      if (state is SuccessCreateReviewState) {
        isSuccess = true;
      } else if (state is ErrorCreateReviewState) {
        isSuccess = false;
      }
    });
    return isSuccess;
  }

  Future<ReviewResponse?> getReviewViewModel(
      int manufacturerID, int no, int limit) async {
    ReviewResponse? reviewResult;

    await _getReviewBloc
        .getReviewBloc(GetReviewEvent(manufacturerID, no, limit));

    await _getReviewBloc.state.listen((state) {
      if (state is SuccessGetReviewState) {
        reviewResult = state.reviewResult;
      } else if (state is ErrorGetReviewState) {
        reviewResult = null;
      }
    });
    return reviewResult;
  }

  Future<bool> editReviewViewModel(int reviewID, int productID, String comment, int rating) async {
    bool isSuccess = false;
    await _editReviewBloc.editReviewBloc(EditReviewEvent(
      getUser.token ?? '',
      reviewID,
      getUser.userDTO.fullName ?? '',
      productID,
      comment,
      rating,
      true
    ));

    await _editReviewBloc.state.listen((state) {
      if(state is SuccessEditReviewState){
        isSuccess = true;
      }else if(state is ErrorEditReviewState){
        isSuccess = false;
      }
    });

    return isSuccess;
  }
}
