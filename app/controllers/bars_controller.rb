class BarsController < ApplicationController

  def index
    @bars = Bar.all

    if params[:query].present?
      @bars = @bars.where('name ILIKE ?', "%#{params[:query]}%")
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "bars/index", locals: {bars: @bars}, formats: [:html] }
    end
  end

  def show
    @bar = Bar.find(params[:id])
  end
end
