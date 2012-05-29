class ChallengesController < ApplicationController
  # GET /challenges
  # GET /challenges.json
  # @@count = 1

  def new
    @challenge = Challenge.new
    @questionaire ||= Questionaire.first
  end

  def create
    @questionaire = Questionaire.where("id > (?)",params["challenge"]["questionaire_id"]).first
    Challenge.new(params[:challenge]).save
    Challenge.count > 10 ? render(:display_result) : redirect_to(new_challenge_path)
  end

  def display_result
  end

  private

  def evaluate_score(challenge)
    expected_answer = Questionaire.find(challenge.questionaire_id).answer
    if challenge.output == expected_answer
      @score = @score + 1
    end
  end
end
