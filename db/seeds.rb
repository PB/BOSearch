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

Place.create(name: 'Summer 2016', country: countries.first, city: cities.first, begins_at: '2016-06-01', ends_at: '2016-07-30')
Place.create(name: 'USA trip', country: countries[2], city: cities[4], begins_at: '2015-01-01', ends_at: '2015-07-30')
Place.create(name: 'Spain trip 1', country: countries[1], city: cities[3], begins_at: '2015-02-01', ends_at: '2015-05-30')
Place.create(name: 'Spain trip 2', country: countries[1], city: cities[6], begins_at: '2015-03-01', ends_at: '2015-10-30')
