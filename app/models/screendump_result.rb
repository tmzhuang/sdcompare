class ScreendumpResult < ApplicationRecord
  #enum result: [:PASS, :WARN, :FAIL]
  def pr
    KnownIssue.where(runtime: self.source_runtime,
                     test: self.test).all.map { |issue| issue.pr }
  end

  def self.latest_source_revision
    revisions = ScreendumpResult.all.pluck(:source_revision).uniq
    return revisions.map { |rev| rev.to_i }.max.to_s
  end

  def self.latest_target_revision
    revisions = ScreendumpResult.all.pluck(:target_revision).uniq
    return revisions.map { |rev| rev.to_i }.max.to_s
  end
end
