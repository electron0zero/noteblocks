class NotebooksController < ApplicationController
  before_action :set_notebook, only: [:show, :update, :destroy]

  # GET /notebooks
  def index
    @notebooks = Notebook.all
    json_response(@notebooks)
  end

  # POST /notebooks
  def create
    @notebook = Notebook.create!(notebook_params)
    json_response(@notebook, :created)
  end

  # GET /notebooks/:id
  def show
    json_response(@notebook)
  end

  # PUT /notebooks/:id
  def update
    @notebook.update(notebook_params)
    head :no_content
  end

  # DELETE /notebooks/:id
  def destroy
    @notebook.destroy
    head :no_content
  end

  private

  def notebook_params
    # whitelist params
    params.permit(:name, :desc)
  end

  def set_notebook
    @notebook = Notebook.find(params[:id])
  end
end