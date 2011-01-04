# By using the symbol ':user', we get Factory Girl to simulate the User mode.
Factory.define :user do |user|
  user.name                   "Chris Browne"
  user.email                  "email@email.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end