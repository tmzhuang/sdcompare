class ScreendumpResultsController < ApplicationController
  before_action :set_screendump_result, only: [:show, :edit, :update, :destroy]

  # GET /screendump_results
  # GET /screendump_results.json
  def index
    @runtime_choices = ScreendumpResult.all.pluck(:runtime).uniq
    @screendump_results = ScreendumpResult.order(test: :asc).order(runtime: :asc).order(result: :asc).all
    @screendump_results = @screendump_results.where(result: filter_params[:results]) if filter_params[:results]
    @screendump_results = @screendump_results.where(runtime: filter_params[:runtimes]) if filter_params[:runtimes]
    if filter_params[:tests]
      tests = filter_params[:tests].split(',').map{|s| s.strip}.join('|')
      #re = tests.map{|s| Regexp.new s}.reduce{|acc,re| Regexp.union(acc,re)}
      @screendump_results = @screendump_results.where("test ~* ?", tests)
    end
    if filter_params
      @previous_tests = filter_params[:tests]
      @previous_runtimes = filter_params[:runtimes]
      @previous_results = filter_params[:results]
    end
  end

  # GET /screendump_results/1
  # GET /screendump_results/1.json
  def show
    #File.open('/home/tzhuang/tmp/img/base.png', 'rb') do |f|
      #send_data f.read, :type => "image/jpeg", :disposition => "inline"
    #end
  end

  # GET /screendump_results/new
  def new
    @screendump_result = ScreendumpResult.new
  end

  # GET /screendump_results/1/edit
  def edit
  end

  # POST /screendump_results
  # POST /screendump_results.json
  def create
    @screendump_result = ScreendumpResult.new(screendump_result_params)

    respond_to do |format|
      if @screendump_result.save
        format.html { redirect_to @screendump_result, notice: 'Screendump result was successfully created.' }
        format.json { render :show, status: :created, location: @screendump_result }
      else
        format.html { render :new }
        format.json { render json: @screendump_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screendump_results/1
  # PATCH/PUT /screendump_results/1.json
  def update
    respond_to do |format|
      if @screendump_result.update(screendump_result_params)
        format.html { redirect_to @screendump_result, notice: 'Screendump result was successfully updated.' }
        format.json { render :show, status: :ok, location: @screendump_result }
      else
        format.html { render :edit }
        format.json { render json: @screendump_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screendump_results/1
  # DELETE /screendump_results/1.json
  def destroy
    @screendump_result.destroy
    respond_to do |format|
      format.html { redirect_to screendump_results_url, notice: 'Screendump result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screendump_result
      @screendump_result = ScreendumpResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def screendump_result_params
      params.fetch(:screendump_result, {})
    end

    def filter_params
      params.permit(:tests, results:[], runtimes:[])
    end
end
