require "spec_helper"

describe "FileChecksums" do
  def assert_checksum(expected, filename)
    filepath = Rails.root.join(filename)
    checksum = Digest::MD5.hexdigest(File.read(filepath))
    assert checksum.in?(Array(expected)), "Bad checksum for file: #{filename}, local version should be reviewed: checksum=#{checksum}, expected=#{Array(expected).join(" or ")}"
  end

  it "should check core checksums" do
    #this js view is completely overridden so it should be adapted if anything change in Redmine core
    assert_checksum %w"7d61d99dcae956a5cd0d896dd20049b4 3e8ca31fbb2aa66bdd3ad7db808d4631", "app/views/issue_categories/create.js.erb"

    #the update action is completely overridden and should be adapted if anything change in Redmine core
    # Redmine 5.1.2 is fine and previous ones too
    assert_checksum %w"15dcb293c42721a34530d89570257106 bf3ee442a603c5f0759b3fc948a6ff95 27f849c985a952b4302ac4a5acd7c1ab b5d6e3adafc967c5fdf669e5cff0375f bfcd39e39a00f922f1633ad2061304c7", "app/controllers/issue_categories_controller.rb"

    #the issue_categories tab is completely overridden and should be adapted if anything change in Redmine core
    # Redmine 5.1.7 & 6.0.4 are fine
    assert_checksum %w"4f107afaf16c1787f6546275373ccff9 c2e64c984c44dcb0df1e14e850652f1f", "app/views/projects/settings/_issue_categories.html.erb"
  end
end
