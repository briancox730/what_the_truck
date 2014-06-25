class VotesController < ApplicationController

  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    @vote = Vote.new(vote_params)
    @vote.review = @review
    @vote.user = current_user
    @vote.save
    after_vote

    redirect_to @review.food_truck
  end

  def update
    @vote = Vote.find(params[:id])
    @review = Review.find(params[:review_id])
    @vote.update(vote: params[:vote][:vote])
    after_change_vote

    redirect_to @review.food_truck
  end

  def destroy

  end

  private

  def vote_params
    params.require(:vote).permit(:vote)
  end
end
