require 'rdf'
require 'rdf/ntriples'

include RDF

graph = RDF::Graph.load("http://rdf.rubyforge.org/doap.nt")
query = RDF::Query.new({
  :person => {
      RDF.type  => FOAF.Person,
      FOAF.name => :name,
      FOAF.mbox => :email,
  }
})

query.execute(graph).each do |solution|
  puts "name=#{solution.name} email=#{solution.email}"
end
