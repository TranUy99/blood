import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/model/review_dtos.dart';
import 'package:mobile_store/src/core/remote/request/review_request/edit_review_request.dart';

class ReviewService {
  static Future<ReviewDTOs> editReviewService(
      int reviewID, String comment, int rating, bool status) async {
    ReviewDTOs reviewResult = await ApiService(dio.Dio())
        .editReview(reviewID, EditReviewRequest(comment, rating, status));

    return reviewResult;
  }
}
