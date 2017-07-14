class ScreendumpResult < ApplicationRecord
  #enum result: [:PASS, :WARN, :FAIL]
  def pr
    KnownIssue.where(runtime: self.source_runtime,
                     test: self.test).all.map { |issue| issue.pr }
  end
end
