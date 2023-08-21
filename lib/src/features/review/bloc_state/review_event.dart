abstract class ReviewEvent {}

class CreateReviewEvent extends ReviewEvent {
  final String token;
  final String userName;
  final int productId;
  final String comment;
  final int rating;
  final bool status;

  CreateReviewEvent(this.token, this.userName, this.productId, this.comment,
      this.rating, this.status);
}

class GetReviewEvent extends ReviewEvent {
  final int manufacturerID;
  final int no;
  final int limit;

  GetReviewEvent(this.manufacturerID, this.no, this.limit);
}

class EditReviewEvent extends ReviewEvent {
  final String token;
  final int reviewId;
  final String userName;
  final int productId;
  final String comment;
  final int rating;
  final bool status;

  EditReviewEvent(this.token, this.reviewId, this.userName, this.productId,
      this.comment, this.rating, this.status);
}
