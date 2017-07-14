module ScreendumpResultsHelper
  def get_label(col)
    if col == 'source_revision'
      return 'SRev'
    elsif col == 'target_revision'
      return 'TRev'
    else
      return col.titleize
    end
  end
end
