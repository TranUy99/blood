import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/remote/request/review_request/create_review_request.dart';
import 'package:mobile_store/src/core/remote/request/review_request/edit_review_request.dart';
import 'package:mobile_store/src/core/remote/response/review_response/edit_review_response.dart';
import 'package:mobile_store/src/core/remote/response/review_response/review_response.dart';

import '../../../core/remote/response/review_response/create_review_response.dart';

class ReviewService {
  Future<EditReviewResponse> editReviewService(
      int reviewID, String token, String comment, int rating, bool status) async {
    EditReviewResponse reviewResult = await ApiService(dio.Dio())
        .editReview(reviewID, 'Bearer $token', EditReviewRequest(comment, rating, status));

    return reviewResult;
  }

  Future<CreateReviewResponse> createReviewService(
      String token, int productId, String comment, int rating, bool status) async {
    CreateReviewResponse createReviewResult = await ApiService(dio.Dio())
        .createReview('Bearer $token', CreateReviewRequest(productId, comment, rating, status));
    return createReviewResult;
  }

  Future<ReviewResponse> getReviewService(int manufacturerID, int no, int limit) async {
    ReviewResponse reviewResult = await ApiService(dio.Dio()).getReview(manufacturerID, no, limit);
    return reviewResult;
  }
}
