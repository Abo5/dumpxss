require 'httparty'
require 'openssl'
system("clear")
logo = <<LOGO
\e[31m
::::    :::  ::::::::  ::::    :::     :::      ::::::::   ::::::::      :::  
:+:+:   :+: :+:    :+: :+:+:   :+:   :+: :+:   :+:    :+: :+:    :+:   :+: :+: 
:+:+:+  +:+ +:+    +:+ :+:+:+  +:+  +:+   +:+  +:+        +:+         +:+   +:+ 
+#+ +:+ +#+ +#+    +:+ +#+ +:+ +#+ +#++:++#++: :#:        +#++:++#++ +#++:++#++: 
+#+  +#+#+# +#+    +#+ +#+  +#+#+# +#+     +#+ +#+   +#+#        +#+ +#+     +#+  
#+#   #+#+# #+#    #+# #+#   #+#+# #+#     #+# #+#    #+# #+#    #+# #+#     #+#   
###    ####  ########  ###    #### ###     ###  ########   ########  ###     ###    
\e[0m

LOGO
logo.each_char do |c|
  print c
  sleep(0.00005)
end

def print_Running...
  print "\e[38;2;255;165;0mRunning\e[0m"
  print "\e[38;2;255;165;0m.\e[0m"
  sleep(0.007)
  print "\e[38;2;255;165;0m.\e[0m"
  sleep(0.007)
  print "\e[38;2;255;165;0m.\e[0m"
  sleep(0.007)
end

print_Running...

url = File.join(__dir__, "url.txt")
payload = File.join(__dir__, "payloads.txt")
proxylist = File.join(__dir__, "proxy.txt")

def send(url, payload)
  begin
    File.open(url, "r") do |file|
      file.each_line do |line|
        File.open(payload, "r") do |payload|
          payload.each_line do |line2|
            modified_url = line.gsub(/=.*/, "=#{line2}")
            response = HTTParty.get(modified_url, verify: OpenSSL::SSL::VERIFY_NONE)  #عشان يدعم https اضفنا بس (verify: false) opensslاو نضيف ونضيف مكتبة (verify: OpenSSL::SSL::VERIFY_NONE)
            if response.body.include?(line2) || response.code == 200
              puts "\n\n"
              puts "\n\nXSS Found   -->     \e[38;2;144;238;144m#{modified_url}\e[0m  -  \e[32m#{response.code}\e[0m\n".gsub(/\s+/, " ")
              File.open(File.join(__dir__, 'output.txt'), 'a') { |f| f.puts(modified_url)}
            else 
              puts "\n\nXSS - NOT Found   -->    \e[38;2;255;182;193m#{modified_url} - #{response.code}\e[0m".gsub(/\s+/, " ")
            end            
          end
        end
      end
    end    
  end
end

send(url, payload)
