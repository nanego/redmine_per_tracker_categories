require 'spec_helper'

describe "FileChecksums" do
  def assert_checksum(expected, filename)
    filepath = Rails.root.join(filename)
    checksum = Digest::MD5.hexdigest(File.read(filepath))
    assert checksum.in?(Array(expected)), "Bad checksum for file: #{filename}, local version should be reviewed: checksum=#{checksum}, expected=#{Array(expected).join(" or ")}"
  end

  it "should check core checksums" do
    #this js view is completely overridden so it should be adapted if anything change in Redmine core
    assert_checksum "7d61d99dcae956a5cd0d896dd20049b4", "app/views/issue_categories/create.js.erb"
  end
end
