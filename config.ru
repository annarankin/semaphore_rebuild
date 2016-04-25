require 'sinatra'
require 'dotenv'
require 'httparty'
require 'semaphoreapp'
require 'pry'
require "sinatra/reloader"

# Load environmental variables
Dotenv.load

# Config is just here for now
Semaphoreapp.auth_token = ENV['SEMAPHORE_TOKEN']

# Require all them files
require_relative 'server.rb'
Dir[File.dirname(__FILE__) + '/services/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/views/helpers/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/controllers/*.rb'].each {|file| require file }

# Break out root/non-namespaced routes so we's can use view helpers
map('/')         { run App::Server }
map('/projects') { run App::ProjectsController }
map('/api')      { run App::ApiController }