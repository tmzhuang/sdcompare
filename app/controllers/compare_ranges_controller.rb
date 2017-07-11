class CompareRangesController < ApplicationController
  before_action :set_compare_range, only: [:show, :edit, :update, :destroy]

  # GET /compare_ranges
  # GET /compare_ranges.json
  def index
    @compare_ranges = CompareRange.all
    @compare_range = CompareRange.new
  end

  # GET /compare_ranges/1
  # GET /compare_ranges/1.json
  def show
  end

  # GET /compare_ranges/new
  def new
    @compare_range = CompareRange.new
  end

  # GET /compare_ranges/1/edit
  def edit
  end

  # POST /compare_ranges
  # POST /compare_ranges.json
  def create
    @compare_range = CompareRange.new(compare_range_params)

    if @compare_range.save
      flash[:success] = 'Record created.'
    else
      flash[:danger] = @compare_range.errors.first
    end
    redirect_to compare_ranges_url
  end

  # PATCH/PUT /compare_ranges/1
  # PATCH/PUT /compare_ranges/1.json
  def update
    respond_to do |format|
      if @compare_range.update(compare_range_params)
        format.html { redirect_to @compare_range, notice: 'Compare range was successfully updated.' }
        format.json { render :show, status: :ok, location: @compare_range }
      else
        format.html { render :edit }
        format.json { render json: @compare_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compare_ranges/1
  # DELETE /compare_ranges/1.json
  def destroy
    @compare_range.destroy
    flash[:success] = 'Record destroyed.'
    redirect_to compare_ranges_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compare_range
      @compare_range = CompareRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compare_range_params
      params.fetch(:compare_range, {}).permit(:test,:runtime,:min_ssim,:max_ssim,:min_hist,:max_hist)
    end
end
