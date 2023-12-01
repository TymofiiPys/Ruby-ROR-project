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

  def debt
    @journal_recs = JournalRec.all
    @debt = @journal_recs.select { |record| record.mark1 == nil ||
                                        record.mark2 == nil ||
                                        record.mark3 == nil }
    # @debt = @journal_recs
  end

  def marks_percent
    @journal_recs = JournalRec.all
    sum = 0.0
    @journal_recs.each do |record|
      sum += record.mark1.nil? ? 0 : record.mark1
      sum += record.mark2.nil? ? 0 : record.mark2
      sum += record.mark3.nil? ? 0 : record.mark3
    end
    @percent = ((sum / (@journal_recs.length * 15)) * 100).round(2)
  end

  def good_marks_percent
    @journal_recs = JournalRec.all
    goodfellas = 0
    @journal_recs.each do |record|
      goodfellas += 1 if goodfella?(record)
    end
    @percent = goodfellas * 100 / @journal_recs.length
  end

  def best_subj
    @journal_recs = JournalRec.all
    geom = 0.0
    alg = 0.0
    inform = 0.0
    @journal_recs.each do |record|
      geom += record.mark1.nil? ? 0 : record.mark1
      alg += record.mark2.nil? ? 0 : record.mark2
      inform += record.mark3.nil? ? 0 : record.mark3
    end
    max = geom
    str = "Геометрія"
    if alg > max
      max = alg
      str = "Алгебра"
    end
    if inform > max
      max = inform
      str = "Інформатика"
    end
    @best_subj = str
  end

  def groups_marks_desc
    @journal_recs = JournalRec.all
    groups_marks_total = Hash.new(0)
    groups_stud = Hash.new(0)
    @journal_recs.each do |record|
      groups_stud[record.group] += 1
      groups_marks_total[record.group] += record.mark1.nil? ? 0 : record.mark1
      groups_marks_total[record.group] += record.mark2.nil? ? 0 : record.mark2
      groups_marks_total[record.group] += record.mark3.nil? ? 0 : record.mark3
    end
    groups_marks_avg = Hash.new(0)
    groups_marks_total.each do |key, _|
      groups_marks_avg[key] = (groups_marks_total[key].to_f * 100/ (groups_stud[key] * 15).to_f).round(2)
    end
    @groups = groups_marks_avg.sort_by {|k, v| v}.reverse
  end

  private
    def journal_rec_params
      params.require(:journal_rec).permit(:surname, :group, :mark1, :mark2, :mark3)
    end

    def goodfella?(record)
      if (!record.mark1.nil? && record.mark1 >= 4) ||
        (!record.mark2.nil? && record.mark2 >= 4) ||
        (!record.mark3.nil? && record.mark3 >= 4)
        return true
      end
      false
    end
end
