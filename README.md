# dumpxss
The script you provided is a Ruby script used for testing Cross-Site Scripting (XSS) vulnerabilities. Here are the features and how it can be used:

# Features:

1- he script utilizes the HTTParty library for making HTTP requests.

2- It clears the console screen using the system("clear") command.

3- It displays a logo using ASCII art.

4- It defines a function print_Running... that displays a running animation.

5- The script reads URLs, payloads, and proxy lists from separate text files: url.txt, payloads.txt, and proxy.txt.

6- It defines a send function that sends requests to the URLs with modified payloads.

7- For each URL in the url.txt file, it iterates through each payload in the payloads.txt file.

8- It modifies the URL by replacing a query parameter's value with the current payload.

9- It sends a GET request to the modified URL using HTTParty, ignoring SSL verification (verify: OpenSSL::SSL::VERIFY_NONE).

10- If the response body includes the payload or the response code is 200, it prints an XSS vulnerability message and writes the URL to output.txt.

11- If the payload is not found in the response body, it prints a message indicating that XSS was not found.



# Usage and Execution:
****To use this script on Terminal, follow these steps:****
Install Ruby: Ensure that Ruby is installed on your system. You can check if Ruby is installed by running ruby -v in the terminal. If Ruby is not installed, you can download and install it from the official Ruby website: https://www.ruby-lang.org/.

Download the Script: Download the script file (CVE-2023-24488.rb) and save it to a directory on your local machine.

Install Required Libraries: Open the terminal and navigate to the directory where you saved the script. Run the following commands to install the required libraries:

```
gem update
```
```
gem install httparty
```
```
gem install openssl
```

These commands will download and install the HTTParty and OpenSSL gems.

Run the Script: Once the libraries are installed, you can run the script by executing the following command in the terminal:

```
ruby CVE-2023-24488.rb
```

The script will start running and perform the XSS vulnerability scanning based on the provided URLs and payloads. The output will be displayed in the terminal.

Please note that this script is provided as an example, and running it without proper authorization on websites is illegal and unethical. Ensure that you have the necessary permissions and legal rights to perform security testing on any target website.
