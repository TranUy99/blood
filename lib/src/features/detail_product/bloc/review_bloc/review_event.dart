abstract class ReviewEvent{}

class CreateReviewEvent extends ReviewEvent{
  final int productId;
  final String comment;
  final int rating;
  CreateReviewEvent(this.productId, this.comment, this.rating);
}

class GetReviewEvent extends ReviewEvent{
  final int manufacturerID;
  final int no;
  final int limit;
  GetReviewEvent(this.manufacturerID, this.no, this.limit);
}

class EditReviewEvent extends ReviewEvent {
  final int reviewID;
  final String comment;
  final int rating;

  EditReviewEvent(this.reviewID, this.comment, this.rating);
}