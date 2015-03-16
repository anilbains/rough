require 'csv'
require 'fileutils'


puts "Deleting all records from the database..."
User.delete_all
Group.delete_all
Member.delete_all
Location.delete_all


puts "Creating Location"
input_file = File.expand_path('../../lib/World_Cities_Location_table.csv', __FILE__)
CSV.foreach(input_file) do |row|
  location = Location.new
  location_items=row[0].split(" ; ")
  location.name=location_items[1]
  location.save
end 

chicago=Location.create(name: "Chicago")




# Create the UserProfiles
puts "Creating User Profile!!"

anil=User.create(firstname: "Anil", lastname: "Bains", dateofbirth: "10-01-1986", location_id: chicago.id, company: "Kellogg School of Management", email: "abains2015@kellogg.northwestern.edu", password: "abc123")
ishita=User.create(firstname: "Ishita", lastname: "Choudhary", dateofbirth: "01-13-1987", location_id: chicago.id, company: "Govt. of India", email: "ishita.a.choudhary@gmail.com", password: "abc123")
ash=User.create(firstname: "Ash", lastname: "Kenney", dateofbirth: "10-01-1987", location_id: chicago.id, company: "Kellogg School of Management", email: "ash2015@kellogg.northwestern.edu", password: "abc123")
nayab=User.create(firstname: "Nayab", lastname: "Khan", dateofbirth: "10-01-1987", location_id: chicago.id, company: "Amazon", email: "nayab2015@kellogg.northwestern.edu", password: "abc123")
steve=User.create(firstname: "Steve", lastname: "Duda", dateofbirth: "10-01-1987", location_id: chicago.id, company: "Kellogg School of Management", email: "steve2015@kellogg.northwestern.edu", password: "abc123")


# Create User Groups

puts "Creating User Groups!!"

iit2008= Group.create(name: "IIT Class of 2008", year: "2008")
mit2004= Group.create(name: "MIT Class of 2004", year: "2004")
csk2010= Group.create(name: "CSK Class of 2010", year: "2010")
kellogg2015= Group.create(name: "Kellogg Class of 2015", year: "2015")
unc2012= Group.create(name: "UNC Class of 2012", year: "2012")

# Create User Activity
puts "Creating Group Members!!"
Member.create(user_id: anil.id, group_id: iit2008.id)
Member.create(user_id: nayab.id, group_id: iit2008.id)
Member.create(user_id: ash.id, group_id: mit2004.id)
Member.create(user_id: ishita.id, group_id: csk2010.id)
Member.create(user_id: anil.id, group_id: kellogg2015.id)
Member.create(user_id: nayab.id, group_id: kellogg2015.id)
Member.create(user_id: ishita.id, group_id: unc2012.id)
Member.create(user_id: steve.id, group_id: unc2012.id)




# To seed User photos
@users=User.all
fid=@users.first.id

my_dir = Dir["C:/code/affinity/app/assets/images/userphotos/*.jpg"]
my_dir.each do |filename|
  # name = File.basename('filename', '.jpg')
  # puts name
  dest_folder = "C:/code/affinity/public/images/userphotos"
  FileUtils.cp(filename, dest_folder)
  fid=fid+1

end

# To change the name of userphotos
i=1
for user in @users
  File.rename("C:/code/affinity/public/images/userphotos/#{i}.jpg","C:/code/affinity/public/images/userphotos/#{user.id}.jpg" )
  i=i+1
end


# To seed Group photos
@groups=Group.all
fid=@groups.first.id

  my_dir = Dir["C:/code/affinity/app/assets/images/groupphotos/*.jpg"]
    my_dir.each do |filename|
      # name = File.basename('filename', '.jpg')
      # puts name
      dest_folder = "C:/code/affinity/public/images/groupphotos"
      FileUtils.cp(filename, dest_folder)
      fid=fid+1
    end

#To change the name of Group Photos
  i=1
  for group in @groups
    File.rename("C:/code/affinity/public/images/groupphotos/#{i}.jpg","C:/code/affinity/public/images/groupphotos/#{group.id}.jpg" )
    i=i+1
  end
