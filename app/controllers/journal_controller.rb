class JournalController < ApplicationController
  def index
    @journal_recs = JournalRec.all
  end

  def show
    @journal_rec = JournalRec.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
