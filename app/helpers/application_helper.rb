module ApplicationHelper
  def blur_root
    'http://blur/bugzilla/show_bug.cgi?id='
  end

  def screendumps_root
    "http://buildbot/screendumps/"
  end

  def diffs_root
    "http://cs-patti/tmp/diff/"
  end

  def diff_uri(screendump_result)
    File.join(diffs_root,
              @screendump_result.source_revision + '-' + @screendump_result.target_revision,
              @screendump_result.source_runtime + '-' + @screendump_result.target_runtime,
              @screendump_result.test)
  end

  def source_screendump_uri(screendump_result)
    File.join(screendumps_root,
              @screendump_result.source_revision,
              @screendump_result.source_runtime,
              @screendump_result.test)

  end

  def target_screendump_uri(screendump_result)
    File.join(screendumps_root,
              @screendump_result.target_revision,
              @screendump_result.target_runtime,
              @screendump_result.test)
  end

  def pr_uri(screendump_result)
    blur_root + screendump_result.pr
  end
end
