class Message
  attr_reader :content

  def initialize(content)
    @content = content
    @encrypted_content = []
  end
end
