import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/create_review_bloc.dart';
import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/create_review_state.dart';
import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/review_event.dart';

class ReviewViewModel {
  final CreateReviewBloc _createReviewBloc = CreateReviewBloc();

  Future<bool> createReviewViewModel(
      int productId, String comment, int rating) async {
    bool isSuccess = false;
    await _createReviewBloc
        .createReviewBloc(CreateReviewEvent(productId, comment, rating));

    await _createReviewBloc.state.listen((state) {
      if (state is SuccessCreateReviewState) {
        isSuccess = true;
      } else if (state is ErrorCreateReviewState) {
        isSuccess = false;
      }
    });
    return isSuccess;
  }
}
