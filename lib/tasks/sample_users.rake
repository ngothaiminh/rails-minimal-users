
namespace :sample do
  desc "Create N sample users (default 100). Usage: rake sample:users[200]"
  task :users, [:n] => :environment do |t, args|
    n = (args[:n] || 100).to_i
    created = 0
    n.times do |i|
      email = "user%05d@example.com" % i
      begin
        User.create!(email: email, name: "User #{i}")
        created += 1
      rescue ActiveRecord::RecordInvalid
        # skip duplicates
      end
    end
    puts "Created #{created} users."
  end
end
