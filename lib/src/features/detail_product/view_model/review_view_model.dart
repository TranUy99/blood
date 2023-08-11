import 'package:mobile_store/src/core/remote/response/review_response/review_response.dart';
import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/create_review_bloc.dart';
import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/create_review_state.dart';
import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/edit_review_bloc.dart';
import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/get_review_bloc.dart';
import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/review_event.dart';
import 'package:mobile_store/src/features/detail_product/service/review_service.dart';

import '../bloc/review_bloc/edit_review_state.dart';
import '../bloc/review_bloc/get_review_state.dart';

class ReviewViewModel {
  final CreateReviewBloc _createReviewBloc = CreateReviewBloc();
  final GetReviewBloc _getReviewBloc = GetReviewBloc();
  final EditReviewBloc _editReviewBloc = EditReviewBloc();

  Future<bool> createReviewViewModel(
      int productId, String comment, int rating) async {
    bool isSuccess = false;
    await _createReviewBloc
        .createReviewBloc(CreateReviewEvent(productId, comment, rating));

    await _createReviewBloc.state.listen((state) {
      if (state is SuccessCreateReviewState) {
        isSuccess = true;
        print('success');
      } else if (state is ErrorCreateReviewState) {
        isSuccess = false;
        print('failed');
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

  Future<bool> editReviewViewModel(int reviewID, String comment, int rating) async {
    bool isSuccess = false;
    await _editReviewBloc.editReviewBloc(EditReviewEvent(reviewID, comment, rating));

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
