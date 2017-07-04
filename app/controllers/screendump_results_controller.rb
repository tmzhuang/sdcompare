class ScreendumpResultsController < ApplicationController
  before_action :set_screendump_result, only: [:show, :edit, :update, :destroy]

  # GET /screendump_results
  # GET /screendump_results.json
  def index
    # Table ordering
    @screendump_results = ScreendumpResult.order(test: :asc).
      order(result: :asc).all
    cols_with_choices = ['source_revision','source_runtime','target_revision','target_runtime','result']
    
    # Filtering
    @choices = {}
    cols_with_choices.each do |col|
      # Generate choices for filter form
      @choices[col] = ScreendumpResult.all.pluck(col).uniq
      # Filter if necessary
      @screendump_results = @screendump_results.where(col => filter_params[col]) if filter_params[col]
    end
    if filter_params[:test]
      tests = filter_params[:test].split(',').map{|s| s.strip}.join('|')
      @screendump_results = @screendump_results.where("test ~* ?", tests)
    end

    # Populate previous choices form if they exist
    @previous_choices = {}
    if filter_params
      filter_params.each do |col,filter|
        print "filter col: #{col.class}"
        @previous_choices[col] = filter
      end
    end
  end

  # GET /screendump_results/1
  # GET /screendump_results/1.json
  def show
    # Get image link for current screendump
    # TODO: This nees to change based on the release tag (for example, use buildbot-51 if running on 5.1)
    @source_screendump_uri = File.join("http://buildbot/screendumps/",
                                @screendump_result.source_revision,
                                @screendump_result.source_runtime,
                                @screendump_result.test)
    @target_screendump_uri = File.join("http://buildbot/screendumps/",
                                @screendump_result.target_revision,
                                @screendump_result.target_runtime,
                                @screendump_result.test)
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
      params.permit(:test, result:[], source_runtime:[], source_revision: [], target_revision: [], target_runtime: [])
    end
end
