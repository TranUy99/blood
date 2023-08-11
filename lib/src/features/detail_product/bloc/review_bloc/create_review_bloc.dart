import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/create_review_state.dart';
import 'package:mobile_store/src/features/detail_product/bloc/review_bloc/review_event.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../main.dart';
import '../../service/review_service.dart';

class CreateReviewBloc {
  ReviewService reviewService = ReviewService();
  String? errors;
  int? httpCode;
  final _stateController = BehaviorSubject<CreateReviewState>();
  Stream<CreateReviewState> get state => _stateController.stream;

  Future<void> createReviewBloc(CreateReviewEvent event) async {
    final createReviewResult = reviewService.createReviewService(
        getUser.token ?? '',
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

    print(httpCode);

    if(httpCode != null){
      _stateController.sink.add(SuccessCreateReviewState());
    }else{
      _stateController.sink.add(ErrorCreateReviewState(errors ?? ''));
    }
  }
}
