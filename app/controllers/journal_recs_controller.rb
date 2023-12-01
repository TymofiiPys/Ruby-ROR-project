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
    @journal_rec = JournalRec.new(journal_rec_params)

    if @journal_rec.save
      redirect_to @journal_rec
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @journal_rec = JournalRec.find(params[:id])
  end

  def update
    @journal_rec = JournalRec.find(params[:id])

    if @journal_rec.update(journal_rec_params)
      redirect_to @journal_rec
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @journal_rec = JournalRec.find(params[:id])
    @journal_rec.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def journal_rec_params
      params.require(:journal_rec).permit(:surname, :group, :mark1, :mark2, :mark3)
    end
end
