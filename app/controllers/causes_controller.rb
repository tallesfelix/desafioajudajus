class CausesController < ApplicationController
  before_action :set_cause, only: [:show, :edit, :update, :destroy]

  # GET /causes
  # GET /causes.json
  def index
    if user_signed_in?
      @causes = Cause.where(:user_id => current_user.id).order('created_at DESC') #Index caso o usuario esteja logado
    elsif lawyer_signed_in?
      @causes = Cause.where(:lawyer_id => current_lawyer) #Index caso o advogado esteja logado
    end
  end

  # GET /causes/1
  # GET /causes/1.json
  def show
  end

  # GET /causes/new
  def new
    @cause = current_user.causes.build
  end

  # GET /causes/1/edit
  def edit
  end

  # POST /causes
  # POST /causes.json
  def create
    @cause = current_user.causes.build(cause_params)
    @cause.lawyer_id = current_user.lawyer_id
    respond_to do |format|
      if @cause.save
        format.html { redirect_to @cause, notice: 'Cause was successfully created.' }
        format.json { render :show, status: :created, location: @cause }
      else
        format.html { render :new }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /causes/1
  # PATCH/PUT /causes/1.json
  def update
    respond_to do |format|
      if @cause.update(cause_params)
        format.html { redirect_to @cause, notice: 'Cause was successfully updated.' }
        format.json { render :show, status: :ok, location: @cause }
      else
        format.html { render :edit }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /causes/1
  # DELETE /causes/1.json
  def destroy
    @cause.destroy
    respond_to do |format|
      format.html { redirect_to causes_url, notice: 'Cause was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cause
      @cause = Cause.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cause_params
      params.require(:cause).permit(:problem, :origin, :destiny, :company, :description)
    end

end
