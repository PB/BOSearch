# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

countries = Country.create([{ name: 'Poland' },
                            { name: 'Spain' },
                            { name: 'USA' },
                            { name: 'Greece' }])

cities = City.create([{ name: 'Warszawa' },
                      { name: 'Gdańsk' },
                      { name: 'Zakopane'},
                      { name: 'Barcelona' },
                      { name: 'New York' },
                      { name: 'Athens' },
                      { name: 'Madrid' }])
