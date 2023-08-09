abstract class ReviewEvent{}

class CreateReviewEvent extends ReviewEvent{
  final int productId;
  final String comment;
  final int rating;
  CreateReviewEvent(this.productId, this.comment, this.rating);
}