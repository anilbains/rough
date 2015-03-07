puts "Deleting all records from the database..."
User.delete_all
Group.delete_all
Member.delete_all
Location.delete_all


puts "Creating Location"
chicago=Location.create(name: "Chicago")
newdelhi=Location.create(name: "New Delhi")
evanston=Location.create(name: "Evanston")
jaipur=Location.create(name: "Jaipur")


# Create the UserProfiles
puts "Creating User Profile!!"

anil=User.create(firstname: "Anil", lastname: "Bains", dateofbirth: "10-01-1986", location_id: chicago.id, company: "Kellogg School of Management")
ishita=User.create(firstname: "Ishita", lastname: "Choudhary", dateofbirth: "01-13-1987", location_id: newdelhi.id, company: "Govt. of India")
ash=User.create(firstname: "Ash", lastname: "Kenney", dateofbirth: "10-01-1987", location_id: evanston.id, company: "Kellogg School of Management")
nayab=User.create(firstname: "Nayab", lastname: "Khan", dateofbirth: "10-01-1987", location_id: jaipur.id, company: "Amazon")
steve=User.create(firstname: "Steve", lastname: "Duda", dateofbirth: "10-01-1987", location_id: chicago.id, company: "Kellogg School of Management")


# Create User Groups

puts "Creating User Groups!!"

iit2008= Group.create(name: "IIT Class of 2008", year: 2008)
mit2004= Group.create(name: "MIT Class of 2004", year: 2004)
csk2010= Group.create(name: "CSK Class of 2010", year: 2010)
kellogg2015= Group.create(name: "Kellogg Class of 2015", year: 2015)
unc2012= Group.create(name: "UNC Class of 2012", year: 2012)

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
