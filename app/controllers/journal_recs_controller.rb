class JournalRecsController < ApplicationController
  def index
    @journal_recs = JournalRec.all
  end

  def show
    @journal_rec = JournalRec.find(params[:id])
  end

  def new
    @journal_rec = JournalRec.new
  end

  def create
    @journal_rec = JournalRec.new(surname: "...", group: "...", mark1: 0, mark2: 0, mark3:0 )

    if @journal_rec.save
      redirect_to @journal_rec
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
