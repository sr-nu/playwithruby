class ChallengesController < ApplicationController
  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @challenges }
    end
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @challenge }
    end
  end

  # GET /challenges/new
  # GET /challenges/new.json
  def new
    @counter = 0
    @score = 0
    @challenge = Challenge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @challenge }
    end
  end

  # GET /challenges/1/edit
  def edit
    @challenge = Challenge.find(params[:id])
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.create(params[:challenge])
    @counter ++
    evaluate_score(@challenge)
    @counter == 10 ? render(:display_result) : render(:new)
  end

  # PUT /challenges/1
  # PUT /challenges/1.json
  def update
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      if @challenge.update_attributes(params[:challenge])
        format.html { redirect_to @challenge, :notice => 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @challenge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy

    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private

  def evaluate_score(challenge)
    expected_answer = Questionaire.find(challenge.questionaire_id).answer
    if challenge.answer == expected_answer
      @score = @score + 1
    end
  end
end
