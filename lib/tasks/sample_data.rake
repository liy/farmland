#coding: utf-8
namespace :db do
  desc 'Fill database with sample data, and index them using elasticsearch'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    make_users
    make_farmers
  end

  def make_users
    @li_yang = User.create(:name => '李旸', :email => 'liy@ac.com', :password => '0000')
    @liu_sisi = User.create(:name => '刘思斯', :email => 'sisi@ac.com', :password => '0000')
  end

  def make_farmers
    100.times do
      Farmer.create(:name => Faker::Name.name)
    end
  end
end