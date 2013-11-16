USER = ENV['SUDO_USER'].strip
HOME = ENV['HOME']

template "#{HOME}/.vimrc" do
  source "vimrc"
  user USER
end

directory "#{HOME}/.vim" do
  action :create_if_missing
  owner USER
end

remote_directory "#{HOME}/.vim" do
  source 'plugins'
  recursive true
  owner USER
  action :create
end
