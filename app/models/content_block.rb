class ContentBlock
  include NetlifyContent

  def self.find_by_path(path, base: Rails.root.join("_blocks"), try_index: false)
    super path, base: base, try_index: try_index
  end

  has_field :name

  def initialize(path, base: nil)
    @parsed_file = FrontMatterParser::Parser.parse_file(path, loader: yaml_loader)
  end
end
