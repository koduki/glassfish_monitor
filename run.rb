require 'mongoid'
require 'lib/models.rb'
require 'lib/glassfish_monitor.rb'
require 'benchmark'

Mongoid.configure do |config|
  config.connect_to("test")
end

username = ARGV[0]
password = ARGV[1]
url = 'service:jmx:rmi://localhost.localdomain:8686/jndi/rmi://localhost.localdomain:8686/jmxrmi' 
mon = GlassFishMonitor.new url, username, password

SystemEnviroment.new(mon.get_system_enviroments).save
SystemCpuResource.new(mon.get_system_cpu_resources).save
SystemMemoryResource.new(mon.get_system_memory_resources).save
AppMemoryResource.new(mon.get_app_memory_resources).save
AppHttpThreadResource.new(mon.get_app_http_thread_resources).save
