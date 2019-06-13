# test-wirecard
* * *

#### Information
This is the automated test project for Kerberus-api project. Designed using Ruby as language and Cubumber as BDD framework, it intends to work as a side project.

#### Requirement
* Ruby version 2.6 and upper
* Chrome-driver

----
#### Installation


```
git clone https://github.com/espita/test-wirecard
sudo apt-get install chromium-chromedriver
```
Within the project folder
```
gem install bundler
bundle install
```
#### rubygems

* cucumber
* rspec
* rake
* capybara
* selenium-webdriver
* httparty
* pry
* jsonpath
* gherkin
* json-minify
* faker
* cpf_faker
* rubocop


# Usage

##### Environment

``` ENV=qa ```

### env.rb

##### ENV['BROWSER']
It's possible test in different browsers, Chrome is the default.

Running all test

Example: ``` ENV=qa cucumber or cucumber features```

Running one feature

Example: ```cucumber  features/order_wirecard.features  ```

OR using tag principal

``` ENV=qa cucumber --tag  @create_order ```

Running scenarios with tag

Example: ```` cucumber -t @one_item features ````

----
