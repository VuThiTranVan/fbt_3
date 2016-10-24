class Admin::BookToursController < ApplicationController
  layout "admin"
  before_action :verify_admin, only: [:index, :destroy]
  before_action :load_book_tours, only: [:destroy]

  def index
    @book_tours = BookTour.paginate page: params[:page],
      per_page: Settings.tour_pages
  end

  def destroy
    if @book_tour.destroy
      flash[:success] = t "admin.book_tour.message_success"
    else
      flash[:danger] = t "admin.book_tour.message_failed"
    end
    redirect_to admin_book_tours_path
  end

  private
  def load_book_tours
    @book_tour = BookTour.find_by id: params[:id]
    unless @book_tour
      redirect_to root_url
    end
  end

  def verify_admin
    unless current_user.is_admin?
      redirect_to root_url
    end
  end
end
