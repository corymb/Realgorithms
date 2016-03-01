require "rake/testtask"


namespace :test do

	%w(integration acceptance).each do |name|
		Rake::TestTask.new(name) do |t|
		t.libs = %W(lib/#{ name } test test/#{ name })
		t.pattern = "test/#{ name }/**/*_test.rb"
		end
	end

	Rake::TestTask.new(all: [:integration, 'acceptance'])
end



task :default => 'test:integration'
