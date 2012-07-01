# $LOAD_PATH << File.expand_path('../../../app/models', __FILE__)
Dir[File.dirname(__FILE__) + "/../../app/models/*.rb"].each do |file|
  require file
end
