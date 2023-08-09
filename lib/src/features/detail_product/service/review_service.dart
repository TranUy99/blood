import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/model/review_dtos.dart';
import 'package:mobile_store/src/core/remote/request/review_request/create_review_request.dart';
import 'package:mobile_store/src/core/remote/request/review_request/edit_review_request.dart';
import 'package:mobile_store/src/core/remote/response/review_request/create_review_response.dart';

class ReviewService {
  Future<ReviewDTOs> editReviewService(
      int reviewID, String comment, int rating, bool status) async {
    ReviewDTOs reviewResult = await ApiService(dio.Dio())
        .editReview(reviewID, EditReviewRequest(comment, rating, status));

    return reviewResult;
  }

  Future<CreateReviewResponse> createReviewService(String token,
      int productId, String comment, int rating, bool status) async {
    print(token);
    CreateReviewResponse createReviewResult = await ApiService(dio.Dio())
        .createReview(
            'Bearer $token', CreateReviewRequest(productId, comment, rating, status));
    return createReviewResult;
  }
}
