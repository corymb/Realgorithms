require 'opal'

module ReactHelpers
  def loader
    opal = Opal::Server.new {|s|
      s.append_path 'js'
      s.main = 'app'
    }
    opal_boot_code = Opal::Processor.load_asset_code(opal.sprockets, 'reacting')
  end
end
