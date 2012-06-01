" Exit quickly when already loaded.
if exists("g:loaded_vim_livereload")
  finish
endif

" Exit quicky if running in compatible mode
if &compatible
  echohl ErrorMsg
  echohl none
  finish
endif

" Check for Ruby functionality.
if !has("ruby")
    echohl ErrorMsg
    echon "Sorry, Vim-Livereload requires ruby support."
  finish
endif

let g:loaded_vim_livereload = "true"

function! Reload_Browser()
  :ruby reload_browser()
endfunction

function! Startup()
  :ruby startup
endfunction

function! Stop()
  :ruby stop
endfunction

augroup livereload
  autocmd BufWritePost * :call Reload_Browser()
  autocmd VimEnter * :call Startup()
  autocmd VimLeave * :call Stop()
augroup END

command Livereload :call Reload_Browser()
command StartLivereload :call Startup()
command StopLivereload :call Stop()

autocmd CursorHold * call Timer()
autocmd CursorHoldI * call Timer()

function! Timer()
    :ruby timer
    call feedkeys("f\e")
endfunction

ruby << EOF
dir = ::VIM::evaluate('&runtimepath').to_s.split(",").select{|s| s["vim-livereload"]}.first + "/vendor"
Dir.foreach(dir){|x| $LOAD_PATH.unshift(dir + "/" + x + "/lib")}
require 'em/pure_ruby'
require 'json'
require 'em-websocket'

module Livereload
  def self.web_sockets
    @web_sockets ||= []
    @web_sockets
  end
end

def reload_browser
  name = VIM::Buffer.current.name
  data = ['refresh', {
    :path           => name,
    :apply_js_live  => @options[:apply_js_live],
    :apply_css_live => @options[:apply_css_live]
  }].to_json
  Livereload.web_sockets.delete_if{|ws| ws.state == :closed}
  Livereload.web_sockets.each do |ws|
    ws.send(data) if ws.state == :connected
  end
  sleep 1
end

def startup
  @options = {
   :api_version => '1.6',
   :host => '0.0.0.0',
   :port => '35729',
   :apply_js_live => true,
   :apply_css_live => true,
   :grace_period => 0
  }
  @@web_sockets = []
  @thread = Thread.new do
    EventMachine.run do
      @server = EventMachine.start_server(@options[:host], @options[:port], EventMachine::WebSocket::Connection, {}) do |ws|
        ws.onopen do
          begin
            ws.send "!!ver:#{@options[:api_version]}"
            Livereload.web_sockets << ws
          rescue
          end
        end

        ws.onmessage do |msg|
        end

        ws.onclose do
          Livereload.web_sockets.delete ws
        end
      end
    end
  end
end

def stop
  @thread.kill
end

def timer
end
EOF

