class KnownIssuesController < ApplicationController
  before_action :set_known_issue, only: [:show, :edit, :update, :destroy]

  # GET /known_issues
  # GET /known_issues.json
  def index
    @known_issue = KnownIssue.new
    @known_issues = KnownIssue.all
  end

  # GET /known_issues/1
  # GET /known_issues/1.json
  def show
  end

  # GET /known_issues/new
  def new
    @known_issue = KnownIssue.new
  end

  # GET /known_issues/1/edit
  def edit
  end

  # POST /known_issues
  # POST /known_issues.json
  def create
    prs = known_issue_params[:pr].split(',')
    success = true
    prs.each do |pr|
      puts 'lkjlj'
      known_issue_params[:pr] = pr
      puts known_issue_params[:pr]
      puts pr
      @known_issue = KnownIssue.new(test: known_issue_params[:test],
                                   runtime: known_issue_params[:runtime],
                                   pr: pr)
      success = @known_issue.save and success
    end

    if success
      flash[:success] = 'Record created.'
      redirect_to known_issues_url
    else
      flash[:danger] = @known_issue.errors.first
      redirect_to known_issues_url
    end
  end

  # PATCH/PUT /known_issues/1
  # PATCH/PUT /known_issues/1.json
  def update
    respond_to do |format|
      if @known_issue.update(known_issue_params)
        format.html { redirect_to @known_issue, notice: 'Known issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @known_issue }
      else
      end
    end
  end

  # DELETE /known_issues/1
  # DELETE /known_issues/1.json
  def destroy
    @known_issue.destroy
    flash[:success] = 'Record deleted.'
    redirect_to known_issues_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_known_issue
      @known_issue = KnownIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def known_issue_params
      params.fetch(:known_issue, {}).permit(:test,:runtime,:pr)
    end
end
