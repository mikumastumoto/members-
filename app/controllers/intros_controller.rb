class IntrosController < ApplicationController
  before_action :set_intro, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /intros
  # GET /intros.json
  def index
    @intros = Intro.all
  end

  # GET /intros/1
  # GET /intros/1.json
  def show
  end

  # GET /intros/new
  def new
    @intro = Intro.new
    @intro = Intro.find_or_create_by(:user_id => current_user.id)
    redirect_to edit_intro_url(@intro)
  end


  # GET /intros/1/edit
  def edit
    if @intro.user_id != current_user.id
      raise ActionController::RoutingError.new(“Not authorized”)
    end
  end

  # POST /intros
  # POST /intros.json
  def create
    @intro = Intro.new(intro_params)

    respond_to do |format|
      if @intro.save
        format.html { redirect_to @intro, notice: 'Intro was successfully created.' }
        format.json { render :show, status: :created, location: @intro }
      else
        format.html { render :new }
        format.json { render json: @intro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intros/1
  # PATCH/PUT /intros/1.json
  def update
    respond_to do |format|
      if @intro.update(intro_params)
        format.html { redirect_to @intro, notice: 'Intro was successfully updated.' }
        format.json { render :show, status: :ok, location: @intro }
      else
        format.html { render :edit }
        format.json { render json: @intro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intros/1
  # DELETE /intros/1.json
  def destroy
    @intro.destroy
    respond_to do |format|
      format.html { redirect_to intros_url, notice: 'Intro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intro
      @intro = Intro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intro_params
      params.require(:intro).permit(:miku, :hyogo)
    end
end
