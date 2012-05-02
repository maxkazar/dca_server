App = Faye::RackAdapter.new(
    :mount => '/faye',
    :timeout => 25,
    :engine  => {
        :type  => Faye::Redis,
        :host  => 'localhost',
        :port  => 6379
    })

App.bind(:subscribe) do |client_id, channel|
  puts "[  SUBSCRIBE] #{client_id} -> #{channel}"
end

App.bind(:unsubscribe) do |client_id, channel|
  puts "[UNSUBSCRIBE] #{client_id} -> #{channel}"
end

App.bind(:disconnect) do |client_id|
  puts "[ DISCONNECT] #{client_id}"
end

App.bind(:publish) do |client_id, channel|
  puts "[    PUBLISH] #{client_id} -> #{channel}"
end